package shadymeadows;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ApiTestRunnerTest {

    @Test
    void runAllFeatures() {
        Results results = Runner.path("classpath:shadymeadows")
                .reportDir("target/karate-reports")   // <- fuerza la carpeta del reporte
                .outputCucumberJson(true)
                .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}