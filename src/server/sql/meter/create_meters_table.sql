/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/*
Creates a table of meters containing 
primary key (generally set by DB,
name:					The name of a meter used for getting data and currently shown to user,
IP addresF: 			for meter data,
enabled: 				True if the meter should get data,
displayable: 			True if meter visible to non-admin users,
meter_type:				The meter type,
timezone:				The time zone for this meter (if null then use site value),
gps: 					Location of this meter,
identifier: 			Is name that will be shown to user in future
note:					Notes about the meter
area:					Area covered by the meter
cumulative:				True if readings provided are the sum usage and not the value for this particular reading
cumulative_reset:		True if pipline is to be reset
cumulative_reset_start:	The earliest time of day that a reset can occur
cumulative_reset_end:	The latest time of day that a reset can occur
previous_day: 			True if reading is from previous day 
reading_length:			Specify the time range on every reading
reading_variation: 		+/- time allowed on length to consider within allowed length
reading: 				The reading from the meter
start_timestamp:		Start timestamp of reading
end_timestamp:			End timestamp of reading
*/
CREATE TABLE IF NOT EXISTS meters (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	ipAddress VARCHAR(20),
	enabled BOOLEAN NOT NULL,
	displayable BOOLEAN NOT NULL,
	meter_type meter_type NOT NULL,
	default_timezone_meter TEXT DEFAULT NULL,
	gps POINT DEFAULT NULL,
	identifier TEXT UNIQUE NOT NULL,
	note VARCHAR(500),
	area FLOAT(8) DEFAULT NULL,
	cumulative BOOLEAN DEFAULT false,
	cumulative_reset BOOLEAN DEFAULT false,
	cumulative_reset_start TIME DEFAULT '00:00:00',
	cumulative_reset_end TIME DEFAULT '23:59:50', 
	previous_day BOOLEAN DEFAULT false,
	reading_length TIME,  
	reading_variation TIME DEFAULT '23:59:59',
	reading REAL DEFAULT 0.0,
	start_timestamp TIMESTAMP DEFAULT '0001-01-01 : 00:00:00',
	end_timestamp TIMESTAMP DEFAULT '0001-01-01 : 00:00:00'   
);
