/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
explain analyze SELECT split_part(a.airline_desc, ':', 1) AS airline,
       to_char(sum(f.flights)::integer, 'FM999,999') AS total_flights,
       avg(depdelayminutes)::numeric(8,1) AS avg_dep_delay,
       avg(arrdelayminutes)::numeric(8,1) AS avg_arr_delay,
       avg(arrdelayminutes)::numeric(8,1)-avg(depdelayminutes)::numeric(8,1) AS delta_mins
FROM faa.otp_r f
INNER JOIN faa.d_airlines a ON a.airlineid = f.airlineid
WHERE f.origin = 'BOS'
  AND FlightDate > '2009-12-31'::date
GROUP BY a.airline_desc
ORDER BY avg(depdelayminutes) DESC;

explain analyze SELECT split_part(a.airline_desc, ':', 1) AS airline,
       to_char(sum(f.flights)::integer, 'FM999,999') AS total_flights,
       avg(depdelayminutes)::numeric(8,1) AS avg_dep_delay,
       avg(arrdelayminutes)::numeric(8,1) AS avg_arr_delay,
       avg(arrdelayminutes)::numeric(8,1)-avg(depdelayminutes)::numeric(8,1) AS delta_mins
FROM faa.otp_r f
INNER JOIN faa.d_airlines_ext a ON a.airlineid = f.airlineid
WHERE f.origin = 'BOS'
  AND FlightDate > '2009-12-31'::date
GROUP BY a.airline_desc
ORDER BY avg(depdelayminutes) DESC;

