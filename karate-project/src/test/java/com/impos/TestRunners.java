package com.impos;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

public class TestRunners {

    @Test
    void run_tests_on_svia_and_generate_report() {
        Results results = Runner.path("classpath:com/impos/tests")
                .tags("~@ignore")
                .parallel(5);

        generatereport(results.getReportDir());
    }

    private void generatereport(String karateOutputPath) {
        List<String> jsonPaths = FileUtils
                .listFiles(new File(karateOutputPath), new String[]{"json"}, true)
                .stream()
                .map(File::getAbsolutePath)
                .collect(Collectors.toList());

        Configuration config = new Configuration(new File("target"), "Fancy Notes");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


}
