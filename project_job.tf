module "dbtcloud_job_dev_def" {
  depends_on = [dbtcloud_project.project,dbtcloud_environment.dev_environment]
  source = "./job_def"
  for_each = var.conf.jobs.dev
  environment_id      = dbtcloud_environment.dev_environment.environment_id
  dbt_version         = try(var.conf.jobs.dev[each.key].dbt_version_job, null)
  execute_steps       = var.conf.jobs.dev[each.key].execute_steps
  generate_docs       = var.conf.jobs.dev[each.key].generate_docs
  name                = var.conf.jobs.dev[each.key].name
  num_threads         = var.conf.jobs.dev[each.key].num_threads
  project_id          = dbtcloud_project.project.id
  triggers = {
    "github_webhook" : var.conf.jobs.dev[each.key].triggers.github_webhook,
    "git_provider_webhook" : var.conf.jobs.dev[each.key].triggers.git_provider_webhook,
    "schedule" : var.conf.jobs.dev[each.key].triggers.schedule,
    "on_merge" : var.conf.jobs.dev[each.key].triggers.on_merge
  }
  target_name          = var.conf.jobs.dev[each.key].target_name
  deferring_environment_id = "${var.conf.jobs.dev[each.key].deferring_environment ?
                                dbtcloud_environment.dev_environment.environment_id : null}"
  schedule_days = var.conf.jobs.dev[each.key].schedule_days
  schedule_hours = var.conf.jobs.dev[each.key].schedule_hours
  schedule_interval = var.conf.jobs.dev[each.key].schedule_interval
  schedule_type = var.conf.jobs.dev[each.key].schedule_type
  schedule_cron = var.conf.jobs.dev[each.key].schedule_cron
  project_name = var.project_name
  run_generate_sources = try(var.conf.jobs.dev[each.key].run_generate_sources,false)
}

module "dbtcloud_job_qa_def" {
  depends_on = [dbtcloud_project.project,dbtcloud_environment.qa_environment]
  source = "./job_def"
  for_each = var.conf.jobs.qa
  environment_id      = dbtcloud_environment.qa_environment.environment_id
  dbt_version         = try(var.conf.jobs.dev[each.key].dbt_version_job, null)
  execute_steps       = var.conf.jobs.qa[each.key].execute_steps
  generate_docs       = var.conf.jobs.qa[each.key].generate_docs
  name                = var.conf.jobs.qa[each.key].name
  num_threads         = var.conf.jobs.qa[each.key].num_threads
  project_id          = dbtcloud_project.project.id
  triggers = {
    "github_webhook" : var.conf.jobs.qa[each.key].triggers.github_webhook,
    "git_provider_webhook" : var.conf.jobs.qa[each.key].triggers.git_provider_webhook,
    "schedule" : var.conf.jobs.qa[each.key].triggers.schedule,
    "on_merge" : var.conf.jobs.qa[each.key].triggers.on_merge
  }
  target_name          = var.conf.jobs.qa[each.key].target_name
  deferring_environment_id = "${var.conf.jobs.qa[each.key].deferring_environment ?
                                dbtcloud_environment.qa_environment.environment_id : null}"
  schedule_days = var.conf.jobs.qa[each.key].schedule_days
  schedule_hours = var.conf.jobs.qa[each.key].schedule_hours
  schedule_interval = var.conf.jobs.qa[each.key].schedule_interval
  schedule_type = var.conf.jobs.qa[each.key].schedule_type
  schedule_cron = var.conf.jobs.qa[each.key].schedule_cron
  project_name = var.project_name
  run_generate_sources = try(var.conf.jobs.qa[each.key].run_generate_sources,false)
}

module "dbtcloud_job_prd_def" {
  depends_on = [dbtcloud_project.project,dbtcloud_environment.prd_environment]
  source = "./job_def"
  for_each = var.conf.jobs.prd
  environment_id      = dbtcloud_environment.prd_environment.environment_id
  dbt_version         = try(var.conf.jobs.dev[each.key].dbt_version_job, null)
  execute_steps       = var.conf.jobs.prd[each.key].execute_steps
  generate_docs       = var.conf.jobs.prd[each.key].generate_docs
  name                = var.conf.jobs.prd[each.key].name
  num_threads         = var.conf.jobs.prd[each.key].num_threads
  project_id          = dbtcloud_project.project.id
  triggers = {
    "github_webhook" : var.conf.jobs.prd[each.key].triggers.github_webhook,
    "git_provider_webhook" : var.conf.jobs.prd[each.key].triggers.git_provider_webhook,
    "schedule" : var.conf.jobs.prd[each.key].triggers.schedule,
    "on_merge" : var.conf.jobs.prd[each.key].triggers.on_merge
  }
  target_name          = var.conf.jobs.prd[each.key].target_name
  deferring_environment_id = "${var.conf.jobs.prd[each.key].deferring_environment ?
                                dbtcloud_environment.prd_environment.environment_id : null}"
  schedule_days = var.conf.jobs.prd[each.key].schedule_days
  schedule_hours = var.conf.jobs.prd[each.key].schedule_hours
  schedule_interval = var.conf.jobs.prd[each.key].schedule_interval
  schedule_type = var.conf.jobs.prd[each.key].schedule_type
  schedule_cron = var.conf.jobs.prd[each.key].schedule_cron
  project_name = var.project_name
  run_generate_sources = try(var.conf.jobs.prd[each.key].run_generate_sources,false)
}
