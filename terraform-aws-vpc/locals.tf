locals{
    resource_name="${var.project}-${var.environment}"
    azs=slice(data.aws_availability_zones.az.names,0,2) #we need 1a, 1b availability zones, so we are slicing the output of availabityzones as required
}