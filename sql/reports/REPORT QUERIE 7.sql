/* An aggregation of raw emissions across the 
	globe by country and type of worksite */

select territory_address, sum(emission_carbon_dioxide) as total_carbon_dioxide,
sum(emission_carbon_monoxide) as total_carbon_monoxide,
sum(emission_methane) as total_methane,
sum(emission_nitrous_oxide) as total_nitrous_oxide,
sum(emission_other_nitrogen_oxides) as total_nitrogen_oxides,
sum(emission_other_hydrocarbons) as total_hydrocarbons,
sum(emission_particulate_matter) as total_particulate_matter
from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, catproduct_id, work.territory_id, emr2.worksite_id as worksite_id, emr2.customer_id as customer_id, worksite_address, worksite_description, time_interval_year
    from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, emr1.machine_id as machine_id, catproduct_id, emr1.worksite_id as worksite_id, emr1.customer_id as customer_id, time_interval_year as time_interval_year
        from (select EMISSION_CARBON_DIOXIDE, EMISSION_CARBON_MONOXIDE, EMISSION_METHANE, EMISSION_NITROUS_OXIDE, EMISSION_OTHER_NITROGEN_OXIDES, EMISSION_OTHER_HYDROCARBONS, EMISSION_PARTICULATE_MATTER, EMISSION_ID, TIME_INTERVAL.TIME_INTERVAL_YEAR, MACHINE_ID, WORKSITE_ID, CUSTOMER_ID
        from emission_record
            inner join time_interval
            on emission_record.time_interval_id = time_interval.time_interval_id) as emr1
        inner join machine as mac
        on emr1.machine_id = mac.machine_id) as emr2
    inner join worksite as work
    on emr2.worksite_id = work.worksite_id) as emr
inner join territory
on emr.territory_id = territory.territory_id
group by territory_address
order by territory_address;
