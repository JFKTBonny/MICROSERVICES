# With the jib-maven-plugin configuration in your pom.xml, an image will be automatically built and pushed when you run the correct Maven goal.



Plugin used:
            We’re using """ jib-maven-plugin """  (com.google.cloud.tools:jib-maven-plugin:3.3.2).
            Jib builds Docker/OCI container images for Java applications without needing a Dockerfile or Docker daemon.

Configured target image:

            <to>
                <image>santonix/${project.artifactId}</image>
            </to>


This means the image will be tagged as:

            santonix/spring-boot-docker-k8s-helm  because ${project.artifactId} = spring-boot-docker-k8s-helm)


Build and push behavior:

            mvn compile jib:build →    builds the image and pushes it to the registry (docker.io/santonix/... by default, since no other registry is specified).
            *********************
            mvn compile jib:dockerBuild → builds the image only locally, loading it into your Docker daemon (no push).
            ***************************


Registry credentials:

Since our <to><image> points to santonix/..., Jib assumes docker.io/santonix/....

            If the repo is public → no auth needed.

            If private → you need to configure Docker Hub credentials (~/.docker/config.json, environment variables, or Maven settings.xml with <server>).

✅ Summary:
With this POM, if you run:

        mvn compile jib:build


Maven + Jib will:

            Build a container image for your Spring Boot app.

            Push it to Docker Hub under santonix/spring-boot-docker-k8s-helm:0.0.1-SNAPSHOT.


