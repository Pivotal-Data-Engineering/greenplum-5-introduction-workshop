/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
set search_path to faa;

SELECT 'Exchange Partitions with external table' as "INFO";

ALTER TABLE otp_rpm
   EXCHANGE PARTITION for ('2009-11-01'::date)
   WITH TABLE ext_otp
   WITHOUT VALIDATION
;

-- NOTE: The old external table is now a base table (after the exchange).
-- SELECT 'Drop old readable external table (which is now a base table)' as "INFO";
-- DROP TABLE ext_otp;
