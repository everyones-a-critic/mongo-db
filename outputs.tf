output "project_id" {
    description="Id of the mongo project. Used as a reference when creating other terraform resources."
    value = mongodbatlas_project.main.id
}