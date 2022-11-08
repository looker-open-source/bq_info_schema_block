- dashboard: performance_summary
  title: Performance Summary
  layout: newspaper
  elements:
  - title: Average Slot Utilization by Hour of Day and Day of Week
    name: Average Slot Utilization by Hour of Day and Day of Week
    model: block_bq_info_schema_v2_v2
    explore: jobs_timeline_by_organization
    type: looker_line
    fields: [jobs_timeline_by_organization.period_start_hour_of_day, jobs_timeline_by_organization.period_start_day_of_week,
      jobs_timeline_by_organization.slots_per_30_days_hour]
    pivots: [jobs_timeline_by_organization.period_start_day_of_week]
    fill_fields: [jobs_timeline_by_organization.period_start_day_of_week, jobs_timeline_by_organization.period_start_hour_of_day]
    sorts: [jobs_timeline_by_organization.period_start_day_of_week 0, jobs_timeline_by_organization.slots_per_30_days_hour
        desc 0]
    limit: 1440
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      Sunday - 6 - jobs_timeline_by_organization.slots_per_30_days_hour: "#EA8600"
    series_labels:
      jobs_timeline_by_organization.period_start_hour_of_day: Hour of Day
      jobs_timeline_by_organization.total_slot_hours: Slots Used
      jobs_timeline_by_organization.period_start_day_of_week: Day of Week
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      jobs_timeline_by_organization.total_slot_hours:
        is_active: false
      jobs_timeline_by_organization.period_start_hour_of_day:
        is_active: false
    series_text_format:
      jobs_timeline_by_organization.period_start_hour_of_day:
        bold: true
      jobs_timeline_by_organization.period_start_day_of_week:
        bold: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#173589",
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Reporting Period: jobs_timeline_by_organization.job_creation_time_date
      Project ID: jobs_timeline_by_organization.project_id
    row: 19
    col: 0
    width: 24
    height: 6
  - title: GB Processed
    name: GB Processed
    model: block_bq_info_schema_v2_v2
    explore: jobs_by_organization_raw
    type: single_value
    fields: [jobs_by_organization_raw.total_gb_processed, jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled]
    sorts: [jobs_by_organization_raw.total_gb_processed desc]
    limit: 500
    dynamic_fields: [{table_calculation: of_which_spilled_to_disk, label: of which
          Spilled to Disk, expression: "${jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled}/${jobs_by_organization_raw.total_gb_processed}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#E8EAED"
    single_value_title: GB Processed This Period
    value_format: 0.00,,"M"
    comparison_label: Spilled to Disk
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled]
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 3
    col: 0
    width: 5
    height: 5
  - title: Power Users
    name: Power Users
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_grid
    fields: [jobs_by_organization_raw.count_of_jobs, jobs_by_organization_raw.total_gb_processed,
      jobs_by_organization_raw.user_email, jobs_by_organization_raw.average_duration_seconds]
    sorts: [jobs_by_organization_raw.total_gb_processed desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      jobs_by_organization_raw.count_of_jobs: Total Jobs
      jobs_by_organization_raw.total_gb_processed: GB Processed
      jobs_by_organization_raw.average_gb_processed: Avg GB processed
      jobs_by_organization_raw.average_slot_utilization: Avg Slots Used
      jobs_by_organization_raw.average_duration_seconds: Avg Duration (sec)
    series_column_widths: {}
    series_cell_visualizations:
      jobs_by_organization_raw.total_gb_processed:
        is_active: true
        palette:
          palette_id: b5551bf4-88e1-b1eb-e8dd-6baad45f5168
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
        value_display: false
      jobs_by_organization_raw.average_slot_utilization:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      jobs_by_organization_raw.count_of_jobs:
        is_active: true
        palette:
          palette_id: a8aa3165-65ff-0b36-37c7-f3f5a62997e8
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
      jobs_by_organization_raw.average_duration_seconds:
        is_active: true
        palette:
          palette_id: 57e8c74a-dd79-2963-94d6-6e3cb5015ff9
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
    conditional_formatting: []
    series_value_format:
      jobs_by_organization_raw.total_gb_processed:
        name: decimal_0
        format_string: "#,##0"
        label: Decimals (0)
      jobs_by_organization_raw.average_slot_utilization:
        name: percent_2
        format_string: "#,##0.00%"
        label: Percent (2)
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 49
    col: 0
    width: 15
    height: 8
  - title: New Tile
    name: New Tile
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: single_value
    fields: [jobs_by_organization_raw.total_queries_ran, jobs_by_organization_raw.percent_of_queries_cached]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#E8EAED"
    single_value_title: Total Queries
    comparison_label: of which Cached
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 8
    col: 0
    width: 5
    height: 5
  - name: <font color="#4285F4" size="45" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> Query Monitoring </strong>
    type: text
    title_text: <font color="#4285F4" size="4.5" weight="bold"><i class="fa fa-tachometer"
      aria-hidden="true"></i><strong> Query Monitoring </strong>
    subtitle_text: <b><font size = "3.5">Identify individual queries driving high
      consumption</b></font>
    body_text: "<center>Click on Job ID to view the execution diagram in the GCP Console,\
      \ or view the Job Stages in the Job Lookup Dashboard<center>"
    row: 0
    col: 0
    width: 24
    height: 3
  - name: <font color="#4285F4" size="45" weight="bold"><i class="fa fa-calendar"
      aria-hidden="true"></i><strong> Scheduling Insight</strong>
    type: text
    title_text: <font color="#4285F4" size="4.5" weight="bold"><i class="fa fa-calendar"
      aria-hidden="true"></i><strong> Scheduling Insight</strong>
    subtitle_text: Understand Org-wide trends in usage and consumption to optimize
      scheduling
    row: 17
    col: 0
    width: 24
    height: 2
  - name: <font color="#4285F4" size="45" weight="bold"><i class="fa fa-user" aria-hidden="true"></i><strong>
      Performance by Project and User</strong>
    type: text
    title_text: <font color="#4285F4" size="4.5" weight="bold"><i class="fa fa-user"
      aria-hidden="true"></i><strong> Performance by Project and User</strong>
    subtitle_text: Identify Projects and Users driving high consumption periods to
      better allocate slot reservations
    row: 39
    col: 0
    width: 24
    height: 2
  - title: Usage by Project
    name: Usage by Project
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_grid
    fields: [jobs_by_organization_raw.count_of_jobs, jobs_by_organization_raw.total_gb_processed,
      jobs_by_organization_raw.average_duration_seconds, jobs_by_organization_raw.project_id]
    sorts: [jobs_by_organization_raw.total_gb_processed desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      jobs_by_organization_raw.count_of_jobs: Total Jobs
      jobs_by_organization_raw.total_gb_processed: GB Processed
      jobs_by_organization_raw.average_gb_processed: Avg GB processed
      jobs_by_organization_raw.average_slot_utilization: Avg Slots Used
      jobs_by_organization_raw.average_duration_seconds: Avg Query Duration
    series_column_widths: {}
    series_cell_visualizations:
      jobs_by_organization_raw.total_gb_processed:
        is_active: true
        palette:
          palette_id: d4a34f60-8e1b-dcc8-9a9c-2180317bf64b
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
        value_display: true
      jobs_by_organization_raw.average_slot_utilization:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      jobs_by_organization_raw.count_of_jobs:
        is_active: true
        palette:
          palette_id: c3e1adc2-d8fa-b122-09f8-0625fc845a5b
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
      jobs_by_organization_raw.average_duration_seconds:
        is_active: true
        value_display: true
        palette:
          palette_id: 73ba18b3-6dbc-0048-bd97-45470343f5a6
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
    conditional_formatting: []
    series_value_format:
      jobs_by_organization_raw.total_gb_processed:
        name: decimal_0
        format_string: "#,##0"
        label: Decimals (0)
      jobs_by_organization_raw.average_slot_utilization:
        name: percent_2
        format_string: "#,##0.00%"
        label: Percent (2)
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 41
    col: 0
    width: 15
    height: 8
  - title: Average Query Duration by Hour of Day and Day of Week
    name: Average Query Duration by Hour of Day and Day of Week
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_line
    fields: [jobs_by_organization_raw.creation_hour_of_day, jobs_by_organization_raw.creation_day_of_week,
      jobs_by_organization_raw.average_duration_seconds]
    pivots: [jobs_by_organization_raw.creation_day_of_week]
    fill_fields: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.creation_hour_of_day]
    sorts: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.average_duration_seconds
        desc 0]
    limit: 1440
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      Sunday - 6 - jobs_by_organization_raw.average_duration_seconds: "#EA8600"
    series_labels:
      jobs_by_organization_raw.creation_time_hour_of_day: Hour of Day
      jobs_by_organization_raw.average_slot_utilization: Slots Used
      jobs_by_organization_raw.creation_time_day_of_week: Day of Week
      jobs_by_organization_raw.average_slots_used: Slots Used
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      jobs_by_organization_raw.average_slot_utilization:
        is_active: false
      jobs_by_organization_raw.creation_time_hour_of_day:
        is_active: false
    series_text_format:
      jobs_by_organization_raw.creation_time_hour_of_day:
        bold: true
      jobs_by_organization_raw.creation_time_day_of_week:
        bold: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#173589",
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 25
    col: 10
    width: 14
    height: 7
  - title: GB Processed by Hour of Day and Day of Week
    name: GB Processed by Hour of Day and Day of Week
    model: block_bq_info_schema_v2
    explore: jobs_timeline_by_organization
    type: looker_line
    fields: [jobs_timeline_by_organization.period_start_hour_of_day, jobs_timeline_by_organization.period_start_day_of_week,
      jobs_timeline_by_organization.gb_processed_30_day]
    pivots: [jobs_timeline_by_organization.period_start_day_of_week]
    fill_fields: [jobs_timeline_by_organization.period_start_day_of_week, jobs_timeline_by_organization.period_start_hour_of_day]
    sorts: [jobs_timeline_by_organization.period_start_day_of_week 0, jobs_timeline_by_organization.gb_processed_30_day
        desc 0]
    limit: 1440
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      Sunday - 6 - jobs_timeline_by_organization.gb_processed_30_day: "#EA8600"
    series_labels:
      jobs_timeline_by_organization.period_start_hour_of_day: Hour of Day
      jobs_timeline_by_organization.total_slot_hours: Slots Used
      jobs_timeline_by_organization.period_start_day_of_week: Day of Week
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      jobs_timeline_by_organization.total_slot_hours:
        is_active: false
      jobs_timeline_by_organization.period_start_hour_of_day:
        is_active: false
    series_text_format:
      jobs_timeline_by_organization.period_start_hour_of_day:
        bold: true
      jobs_timeline_by_organization.period_start_day_of_week:
        bold: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#173589",
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Reporting Period: jobs_timeline_by_organization.job_creation_time_date
      Project ID: jobs_timeline_by_organization.project_id
    row: 32
    col: 10
    width: 14
    height: 7
  - title: Queries Spilling to Disk
    name: Queries Spilling to Disk
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_grid
    fields: [jobs_by_organization_raw.job_id, jobs_by_organization_raw.user_email,
      jobs_by_organization_raw__job_stages.total_shuffles, jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled]
    filters:
      jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled: ">0"
    sorts: [jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled
        desc]
    limit: 20
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      jobs_by_organization_raw.query_total_slot: Slots Used
      jobs_by_organization_raw.total_gb_processed: Total GB
      jobs_by_organization_raw.duration_seconds: Duration (Sec)
      jobs_by_organization_raw.sum_shuffle_output_bytes_spilled: Bytes Spilled
    series_column_widths: {}
    series_cell_visualizations:
      jobs_by_organization_raw.total_gb_processed:
        is_active: false
        palette:
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
        value_display: false
      jobs_by_organization_raw.average_slot_utilization:
        is_active: false
        palette:
          palette_id: b477b8ad-b459-06b8-fe09-47fc095a7e86
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#27fa1a"
          - "#6ede13"
          - "#cdd61f"
          - "#bf881e"
          - "#c21816"
      jobs_by_organization_raw.query_total_slot:
        is_active: true
        palette:
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      jobs_by_organization_raw.duration_ms:
        is_active: true
        palette:
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      jobs_by_organization_raw.duration_seconds:
        is_active: true
        palette:
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      jobs_by_organization_raw__job_stages.total_shuffles:
        is_active: true
        palette:
          palette_id: 110e6443-3073-2600-43a4-bec52aa854b2
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
        value_display: false
      jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled:
        is_active: true
        palette:
          palette_id: 31698734-f6ca-a94d-3702-83e10bd40994
          collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
          custom_colors:
          - "#3EB0D5"
          - "#4285F4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#173589",
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    series_value_format:
      jobs_by_organization_raw.total_gb_processed:
        name: decimal_4
        format_string: "#,##0.0000"
        label: Decimals (4)
      jobs_by_organization_raw.average_slot_utilization:
        name: decimal_4
        format_string: "#,##0.0000"
        label: Decimals (4)
      jobs_by_organization_raw.query_total_slot:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
      jobs_by_organization_raw__job_stages.total_shuffle_output_gibibytes_spilled:
        name: decimal_0
        format_string: "#,##0"
        label: Decimals (0)
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields:
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 10
    col: 5
    width: 19
    height: 7
  - title: Average Query Duration
    name: Average Query Duration
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: single_value
    fields: [jobs_by_organization_raw.average_duration_seconds]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#E8EAED"
    single_value_title: Avg Query Duration (Sec)
    comparison_label: of which Cached
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
      Project ID: jobs_by_organization_raw.project_id
    row: 13
    col: 0
    width: 5
    height: 4
  - title: Queries by Day of Week
    name: Queries by Day of Week
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_column
    fields: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.average_duration_seconds,
      jobs_by_organization_raw.total_queries_ran]
    fill_fields: [jobs_by_organization_raw.creation_day_of_week]
    sorts: [jobs_by_organization_raw.creation_day_of_week]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      jobs_by_organization_raw.average_duration_seconds: line
    series_colors:
      jobs_by_organization_raw.average_duration_seconds: "#EA4335"
      jobs_by_organization_raw.total_queries_ran: "#4285F4"
    defaults_version: 1
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
    row: 25
    col: 0
    width: 10
    height: 7
  - title: Performance by Date
    name: Performance by Date
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_line
    fields: [jobs_by_organization_raw.creation_date, jobs_by_organization_raw.average_duration_seconds,
      jobs_by_organization_raw.total_gb_processed]
    fill_fields: [jobs_by_organization_raw.creation_date]
    sorts: [jobs_by_organization_raw.creation_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: !!null '', orientation: left,
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      jobs_by_organization_raw.total_gb_processed: Total GB Processed
    defaults_version: 1
    listen:
      Reporting Period: jobs_by_organization_raw.creation_date
    row: 3
    col: 5
    width: 19
    height: 7
  - title: GB Processed Last Week vs This Week
    name: GB Processed Last Week vs This Week
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw
    type: looker_column
    fields: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.creation_week,
      jobs_by_organization_raw.total_gb_processed]
    pivots: [jobs_by_organization_raw.creation_week]
    fill_fields: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.creation_week]
    filters:
      jobs_by_organization_raw.creation_date: 2 weeks
    sorts: [jobs_by_organization_raw.creation_day_of_week, jobs_by_organization_raw.creation_week]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total GB Processed, orientation: left,
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    series_labels: {}
    defaults_version: 1
    listen: {}
    row: 32
    col: 0
    width: 10
    height: 7
  - title: Week over Week Usage by Project
    name: Week over Week Usage by Project
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw_all_queries
    type: looker_line
    fields: [jobs_by_organization_raw_all_queries.project_id, jobs_by_organization_raw_all_queries.creation_week,
      jobs_by_organization_raw_all_queries.total_gb_processed]
    pivots: [jobs_by_organization_raw_all_queries.project_id]
    fill_fields: [jobs_by_organization_raw_all_queries.creation_week]
    filters:
      project_gb_rank_ndt.rank: "<=10"
    sorts: [jobs_by_organization_raw_all_queries.creation_week desc, jobs_by_organization_raw_all_queries.project_id]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total GB Processed, orientation: left, showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Reporting Period: jobs_by_organization_raw_all_queries.creation_date
      Project ID: jobs_by_organization_raw_all_queries.project_id
    row: 41
    col: 15
    width: 9
    height: 16
  filters:
  - name: Reporting Period
    title: Reporting Period
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
  - name: Project ID
    title: Project ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_bq_info_schema_v2
    explore: jobs_by_organization_raw_all_queries
    listens_to_filters: []
    field: jobs_by_organization_raw_all_queries.project_id