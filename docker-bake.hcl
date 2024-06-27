target "docker-metadata-action" {}
target "github-metadata-action" {}

target "default" {
    inherits = [ "smee-client" ]
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "local" {
    inherits = [ "smee-client" ]
    tags = [ "swarmlibs/smee-client:local" ]
}

target "smee-client" {
    context = "."
    dockerfile = "Dockerfile"
    inherits = [
        "docker-metadata-action",
        "github-metadata-action",
    ]
}
