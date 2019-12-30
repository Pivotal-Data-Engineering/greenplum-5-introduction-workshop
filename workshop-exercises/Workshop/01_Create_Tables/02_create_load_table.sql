/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop table if exists faa.otp_load;
create table faa.otp_load(
 flt_year smallint,
 flt_quarter smallint,
 flt_month smallint,
 flt_dayofmonth smallint,
 flt_dayofweek smallint,
 flightdate date,
 uniquecarrier character varying(7),
 airlineid smallint,
 carrier character(3),
 tailnum character(6),
 flightnum character varying(5),
 origin	 character(3),
 origincityname character varying(35),
 originstate character(2),
 originstatefipscode smallint,
 originstatename character varying(50),
 originwacid smallint,
 dest character(3),
 destcityname character varying(35),
 deststate character(2),
 deststatefipscode smallint,
 deststatename character varying(50),
 destwacid smallint,
 crsdeptime time,
 deptime time,
 depdelay smallint,
 depdelayminutes smallint,
 depdel15 boolean,
 departuredelaygroups smallint,
 deptimeblkid character(10),
 taxiout smallint,
 wheelsoff time,
 wheelson time,
 taxiin smallint,
 crsarrtime time,
 arrtime time,
 arrdelay smallint,
 arrdelayminutes smallint,
 arrdel15 boolean,
 arrivaldelaygroups smallint,
 arrtimeblkid character(10),
 cancelled boolean,
 cancellationcode character(1),
 diverted boolean,
 crselapsedtime smallint,
 actualelapsedtime smallint,
 airtime smallint,
 flights smallint,
 distance smallint,
 distancegroup smallint,
 carrierdelay smallint,
 weatherdelay smallint,
 nasdelay smallint,
 securitydelay smallint,
 lateaircraftdelay smallint,
 firstdeptime time,
 totaladdgtime smallint,
 longestaddgtime smallint,
 divairportlandings smallint,
 divertedreacheddest boolean,
 divactualelapsedtime smallint,
 divarrdelay smallint,
 divdistance smallint,
 div1airport character(3),
 div1wheelson time,
 div1totalgtime smallint,
 divlongestgtime smallint,
 div1wheelsoff time,
 div1tailnum character(6),
 div2airport character(3),
 div2wheelson time,
 div2totalgtime smallint,
 div2longestgtime smallint,
 div2wheelsoff time,
 div2tailnum character(6),
 div3airport character(3),
 div3wheelson time,
 div3totalgtime smallint,
 div3longestgtime smallint,
 div3wheelsoff time,
 div3tailnum character(6),
 div4airport character(3),
 div4wheelson time,
 div4totalgtime smallint,
 div4longestgtime smallint,
 div4wheelsoff time,
 div4tailnum character(6),
 div5airport character(3),
 div5wheelson time,
 div5totalgtime smallint,
 div5longestgtime smallint,
 div5wheelsoff time,
 div5tailnum character(6)
)
with (oids=false)
distributed randomly
;
