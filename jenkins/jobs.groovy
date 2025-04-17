pipelineJob('spring-boot-CI') {
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
