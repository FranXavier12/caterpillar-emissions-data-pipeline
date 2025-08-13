/* A simpler join query that aggregates all emissions recorded for the year 
	2025 by the emitting product model for marketing and research direction */
	
select catproduct_id, CATPRODUCT_CATEGORY, sum(emission_carbon_dioxide) as total_carbon_dioxide,
sum(emission_carbon_monoxide) as total_carbon_monoxide,
sum(emission_methane) as total_methane,
sum(emission_nitrous_oxide) as total_nitrous_oxide,
sum(emission_other_nitrogen_oxides) as total_nitrogen_oxides,
sum(emission_other_hydrocarbons) as total_hydrocarbons,
sum(emission_particulate_matter) as total_particulate_matter
from (select EMISSION_CARBON_DIOXIDE, EMISSION_CARBON_MONOXIDE, EMISSION_METHANE, EMISSION_NITROUS_OXIDE, EMISSION_OTHER_NITROGEN_OXIDES, EMISSION_OTHER_HYDROCARBONS, EMISSION_PARTICULATE_MATTER, EMISSION_ID, TIME_INTERVAL.TIME_INTERVAL_YEAR, MACHINE_ID
    from emission_record
    inner join time_interval
    on emission_record.time_interval_id = time_interval.time_interval_id) as emr
inner join (select machine_id, machine.catproduct_id, CATPRODUCT_CATEGORY
    from machine inner join catproduct
    on machine.catproduct_id = catproduct.catproduct_id) as prod
on emr.machine_id = prod.machine_id
where emr.time_interval_year = 2025
group by catproduct_id, CATPRODUCT_CATEGORY
order by CATPRODUCT_CATEGORY;
