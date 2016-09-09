class pe_metric_curl_cron_jobs (
  String        $output_dir    = '/opt/puppetlabs/pe_metric_curl_cron_jobs',
  Array[String] $metrics_types = ['puppet_server', 'puppetdb'],
) {

  $scripts_dir        = "${output_dir}/scripts"

  file { [ $output_dir, $scripts_dir ] :
    ensure => directory,
  }

  Pe_metric_curl_cron_jobs::Pe_metric {
    output_dir  => $output_dir,
    scripts_dir => $scripts_dir,
  }

  $metrics_types.each | $metric | {
    pe_metric_curl_cron_jobs::pe_metric { $metric : }
  }

}
