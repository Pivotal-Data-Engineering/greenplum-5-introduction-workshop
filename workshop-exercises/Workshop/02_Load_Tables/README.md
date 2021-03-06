There are a number of ways to populate a table with data.  In the Pivotal Greenplum Database, INSERT and COPY work just like they do in PostgreSQL.  These are appropriate for small amounts of data, but are single-threaded and do not enjoy the benefits of loading "MPP" style. Greenplum utilities for data loading use Scatter Gather technology for parallel loading of data. For large data sets, the gpfdist utility is used. gpfdist is Greenplum's parallel file distribution program. It is used by readable external tables and gpload to serve external table files to all segments in parallel.

In this exercise, the smaller dimension tables are loaded with INSERT or COPY statements, but the larger load table is loaded using gpfdist and an external table. An alternative method is to use gpload.

gpload is a data loading utility that acts as an interface to the Greenplum external table parallel loading feature. Using a load specification defined in a YAML formatted control file, gpload executes a load by:
* invoking the Greenplum parallel file server (gpfdist)
* creating an external table definition based on the source data defined
* executing an INSERT, UPDATE or MERGE operation to load the source data into the target table in the database.

gpload then cleans up by stopping gpfdist and dropping the external table.
These are discussed in the Pivotal Greenplum Load Tools document.  

We also load from our staging table into our production fact table.  We take the data in otp_load and move some of it to otp_r, a row oriented (heap) version of the fact table.  Why not load it directly into the fact table?  For one, data is often dirty and may not load properly. In our example, some 29000 rows out of 1.5 M had an incorrectly formatted data field.  You might want to run a fix-it script to recover that data.

The second reason we did this is to do a simple ELT job.  We omitted many columns and also changed the data type of several fields from INTEGER to FLOAT8 because our analytic routines prefer FLOAT8s.  We could have used the cast operator :: each time we used the routines, but this would have been inefficient.  
