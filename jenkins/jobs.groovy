import jenkins.model.*
import javaposse.jobdsl.plugin.ExecuteDslScripts

// Create a pipeline job
def jobName = 'spring-boot-CI'

println ">> Checking if job '${jobName}' exists..."

def jenkins = Jenkins.instance

if (jenkins.getItem(jobName) == null) {
    println ">> Creating job '${jobName}'..."

    pipelineJob(jobName) {
        definition {
            cpsScm {
                scm {
                    git {
                        remote {
                            url('https://github.com/tamakanshika/spring-boot-CI')

                        }
                        branches('*/master')
                    }
                }
            }
        }
    }

    println ">> Job '${jobName}' created successfully!"
} else {
    println ">> Job '${jobName}' already exists, skipping."
}

