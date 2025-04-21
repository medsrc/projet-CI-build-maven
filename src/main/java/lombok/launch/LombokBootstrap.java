package lombok.launch;

import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.IllegalClassFormatException;
import java.lang.instrument.Instrumentation;
import java.net.URL;
import java.net.URLClassLoader;
import java.security.ProtectionDomain;
import java.util.jar.JarFile;

/**
 * This Java agent does not transform bytecode, but acts as a watcher that can figure out when it is appropriate to load
 * Lombok itself. It relies on several facts:
 * <ul>
 * <li>maven-compiler-plugin contains an AbstractCompilerMojo class that compiler instances extend.
 * <li>Maven loaders are ClassRealms, which extend URLClassLoader.
 * <li>Each plugin dependency in the pom.xml is represented as a file URL on the ClassRealm that points to the artifact.
 * <li>URLs to Maven artifacts contain the group and artifact ids ([...]/groupid/artifactid/ver/artifactid-ver.jar).
 * <li>The Lombok Java agent class is lombok.launch.Agent.
 * </ul>
 * Given all of the above, the transformer simply waits for AbstractCompilerMojo to be loaded, then uses the loader to
 * find the path to the Lombok jar file, and finally loads the Lombok agent using reflection.
 */
public final class LombokBootstrap
{
    private static final String MAVEN_COMPILER_TRIGGER_CLASS = "org/apache/maven/plugin/compiler/AbstractCompilerMojo";
    private static final String LOMBOK_URL_IDENTIFIER = "/org/projectlombok/lombok/";
    private static final String LOMBOK_AGENT_CLASS = "lombok.launch.Agent";
    private static final byte[] NOT_TRANSFORMED = null;

    private LombokBootstrap()
    {}

    /**
     * Invoked when agent is added via -javaagent argument.
     *
     * @param agentArgs
     *            arguments
     * @param instrumentation
     *            service provider
     */
    public static void premain(final String agentArgs, final Instrumentation instrumentation)
    {
        instrumentation.addTransformer(new ClassFileTransformer() {
            @Override
            public byte[] transform(final ClassLoader loader, final String className, final Class<?> cbr, final ProtectionDomain pd,
                    final byte[] cfb)
                throws IllegalClassFormatException
            {
                if (MAVEN_COMPILER_TRIGGER_CLASS.equals(className)) {
                    for (final URL url : ((URLClassLoader)loader).getURLs()) {
                        if (url.getPath().contains(LOMBOK_URL_IDENTIFIER)) {
                            try {
                                instrumentation.appendToSystemClassLoaderSearch(new JarFile(url.getPath()));
                                LombokBootstrap.class.getClassLoader().loadClass(LOMBOK_AGENT_CLASS)
                                        .getDeclaredMethod("premain", String.class, Instrumentation.class)
                                        .invoke(null, agentArgs, instrumentation);
                                instrumentation.removeTransformer(this);
                                break;
                            } catch (final Exception e) {
                                //There are no appropriate loggers available at this point in time.
                                e.printStackTrace(System.err);
                            }
                        }
                    }
                }
                return NOT_TRANSFORMED;
            }
        });
    }
}
