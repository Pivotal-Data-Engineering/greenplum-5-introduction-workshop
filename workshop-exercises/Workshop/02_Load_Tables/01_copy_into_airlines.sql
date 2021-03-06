/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\COPY faa.d_airlines FROM '/home/gpuser/data/faa/L_AIRLINE_ID.csv'  CSV HEADER LOG ERRORS SEGMENT REJECT LIMIT 50 ROWS;
select count(*) from faa.d_airlines;
select gp_read_error_log('d_airlines');
analyze faa.d_airlines;
