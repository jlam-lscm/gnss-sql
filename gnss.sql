SELECT rmd.sys_name, COUNT(*) AS count_per_sys_name FROM (SELECT rmd.* FROM raim_measurement_data rmd INNER JOIN (SELECT sys_name, MAX(created_at) AS max_created_at FROM raim_measurement_data GROUP BY sys_name) latest_created ON rmd.sys_name = latest_created.sys_name AND rmd.created_at = latest_created.max_created_at INNER JOIN (SELECT sys_name, MAX(tow) AS max_tow FROM raim_measurement_data GROUP BY sys_name) max_tow_data ON rmd.sys_name = max_tow_data.sys_name AND rmd.tow = max_tow_data.max_tow ORDER BY rmd.id DESC, rmd.created_at DESC, rmd.tow DESC) AS filtered_data GROUP BY filtered_data.sys_name;



