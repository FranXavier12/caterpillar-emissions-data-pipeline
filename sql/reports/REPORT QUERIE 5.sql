/* A modification of the above query (REPORT QUERIE 4) designed to produce a similar report 
	for all operations in the USA by company. Similarly, this report should be very positive. */
	
select source.customer_id, customer_name,
sum(iif(Carbon_Dioxide_Compliance='COMPLIANT',1,0))/count(*) as Carbon_Dioxide_Compliance,
sum(iif(Carbon_Monoxide_Compliance='COMPLIANT',1,0))/count(*) as Carbon_Monoxide_Compliance,
sum(iif(Methane_Compliance='COMPLIANT',1,0))/count(*) as Methane_Compliance,
sum(iif(Nitrous_Oxide_Compliance='COMPLIANT',1,0))/count(*) as Nitrous_Oxide_Compliance,
sum(iif(Other_Nitrogen_Oxides_Compliance='COMPLIANT',1,0))/count(*) as Other_Nitrogen_Oxides_Compliance,
sum(iif(Other_Hydrocarbons_Compliance='COMPLIANT',1,0))/count(*) as Other_Hydrocarbons_Compliance,
sum(iif(Particulate_Matter_Compliance='COMPLIANT',1,0))/count(*) as Particulate_Matter_Compliance
from
(select emission_id, emr.catproduct_id, emr.territory_id, customer_id, worksite_id, 
iif(emr.emission_carbon_dioxide / emr.emission_fuel_spent < isnull(ems.emission_carbon_dioxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Carbon_Dioxide_Compliance,
iif(emr.emission_carbon_monoxide / emr.emission_fuel_spent < isnull(ems.emission_carbon_monoxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Carbon_Monoxide_Compliance,
iif(emr.emission_methane / emr.emission_fuel_spent < isnull(ems.emission_methane,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Methane_Compliance,
iif(emr.emission_nitrous_oxide / emr.emission_fuel_spent < isnull(ems.emission_nitrous_oxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Nitrous_Oxide_Compliance,
iif(emr.emission_other_nitrogen_oxides / emr.emission_fuel_spent < isnull(ems.emission_other_nitrogen_oxides,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Other_Nitrogen_Oxides_Compliance,
iif(emr.emission_other_hydrocarbons / emr.emission_fuel_spent < isnull(ems.emission_other_hydrocarbons,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Other_Hydrocarbons_Compliance,
iif(emr.emission_particulate_matter / emr.emission_fuel_spent < isnull(ems.emission_particulate_matter,1000000), 'COMPLIANT', 'NONCOMPLIANT') as Particulate_Matter_Compliance
from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, catproduct_id, work.territory_id as territory_id, emr2.worksite_id as worksite_id, emr2.customer_id as customer_id, worksite_address, EMISSION_FUEL_SPENT
    from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, emr1.machine_id as machine_id, catproduct_id, emr1.worksite_id as worksite_id, emr1.customer_id as customer_id, EMISSION_FUEL_SPENT
        from emission_record as emr1
        inner join machine as mac
        on emr1.machine_id = mac.machine_id) as emr2
    inner join worksite as work
    on emr2.worksite_id = work.worksite_id) as emr, em_standard as ems
where emr.catproduct_id = ems.catproduct_id
and emr.territory_id = ems.territory_id) as source
left join customer
on source.customer_id = customer.customer_id
where source.territory_id = 0
group by source.customer_id, customer_name
order by customer_name;
