# README

## Required Permissions
The Block in its current form is built off of the JOBS_BY_ORGANIZATION and JOBS_TIMELINE_BY_ORGANIZATION, to provide a complete picture of usage across all projects. This block requires a Service Account with the following BigQuery permissions:  bigquery.jobs.listAll for the organization and is available to the Organization bigquery.resourceAdmin, Organization Owner and Organization Admin roles. Note that JOBS_BY_ORGANIZATION is only available to users with defined Google Cloud organizations. More information on permissions and access control in BigQuery can be found [here](https://cloud.google.com/bigquery/docs/access-control).

## What does this Block do for me?
This repository contains a Looker block for monitoring and optimizing Google BigQuery usage and performance, built off of the [Information Schema](https://cloud.google.com/bigquery/docs/information-schema-intro) tables provided natively within BigQuery. This block is currently built for customers with Committed Slots (Flat-Rate Customers) only, using the Information Schema metadata tables to monitor resource usage against capacity and query performance across an entire organization.
A key metric across the dashboards in this Block is Total Slots Used. BigQuery uses [Slots](https://cloud.google.com/bigquery/docs/slots) (virtual CPUs) to execute queries in a heavily-distributed parallel architecture. Customers on the flat-rate pricing model explicitly choose how many slots to reserve, also known as [Slot Commitments](https://cloud.google.com/bigquery/docs/reservations-intro#commitments), which can be purchased at the Annual, Monthly, or Flex (60-second) level. Queries run within that capacity, and you pay for that capacity continuously every second it's deployed. For example, if you purchase 2,000 BigQuery slots, your queries in aggregate are limited to using 2,000 virtual CPUs at any given time. You will have this capacity until you delete it, and you will pay for 2,000 slots until you delete them. This Block will, among other things, help optimize your use of the existing slots committed, as well as drive informed decision - making when purchasing additional commitments of the Annual, Monthly, or Flex type.
The Block is composed of two Principal Dashboards (Issue Investigation and Performance Summary), as well as a Job Look-Up Dashboard. The Issue Investigation dashboard is designed to be an in-depth summary of Slot Usage against Capacity across the entire organization, over any 6 hour window in the past 6 months. The Performance Summary dashboard is designed to be a more high-level overview of the health and efficiency of your BigQuery organization, identifying trends and anomalies that require a deeper investigation. A summary of the metrics contained in these dashboards their significance is included below:

## Time Window Investigation Dashboard

### GB processed / % shuffled to disk - optimization
The percentage of [data written to shuffle and spilled to disk](https://cloud.google.com/bigquery/query-plan-explanation) can be a good indicator of queries that are overwhelming slot resources and could be further optimized, for example, queries with heavy [data skews](https://cloud.google.com/bigquery/docs/best-practices-performance-patterns#data_skew). Use the Job Lookup Dashboard to drill into individual queries that are spilling heavy volumes of data to disk, viewing their individual stages and identifying opportunities for optimization.

### Number of queries / % of cached queries
A higher percentage of [Cached queries](https://cloud.google.com/bigquery/docs/cached-results) will result in lower on-demand costs and lower resource utilization. In addition to reducing costs, queries that use cached results are significantly faster because BigQuery does not need to compute the result set.

### Slot Utilization vs Commitments
This tile reflects the average slot utilization over 5 minute windows against the number of committed [slots for flat-rate customers](https://cloud.google.com/bigquery/docs/slots), stacking for annual, monthly and flex (60-second) commits.
This is a good indicator of periods of heavy resource consumption across the organization. During these high-utilization spikes, queries might be competing for slots and take longer to execute.
This tile will also show [flex slot](https://cloud.google.com/blog/products/data-analytics/introducing-bigquery-flex-slots) commitments, which can be procured programmatically to accommodate these spikes
You can drill down on any of these high utilization time windows to understand what jobs were running at the point in time and continue your investigation from there.

### Slot Usage by Project
This tile reflects Slot Utilization in 5 minute intervals broken down by the individual Project ID consuming those slots. This will help connect anomalous usage to individual projects for further investigation. The Block in it's current form does not tie projects to their individual Slot [Reservation](https://cloud.google.com/bigquery/docs/reservations-intro#reservations), although it is a consideration for future iterations.

### Organization-wide Concurrency
Concurrency can point to anomalously high utilization and, together with the Slot Utilization tile can be used to investigate which jobs were running at that point in time

## Performance Summary Dashboard
This dashboard shows a higher level view of usage and user experience across the organization for a longer period of time (recommended maximum of 30 days)

## BigQuery Information Schema Data Structure
BigQuery recently released the native Information Schema tables, which provide metadata around job execution, database structure and query performance. These tables have the same structure and schema across every BigQuery environment. More information on the Information Schema can be found in [Google Cloud documentation](https://cloud.google.com/bigquery/docs/information-schema-intro).
