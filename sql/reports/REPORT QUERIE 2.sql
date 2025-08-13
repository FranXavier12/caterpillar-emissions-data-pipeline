/* a more detailed version of the base query that retains 
	some identifying information for further querying */
	
select emission_id, catproduct_id, territory_id, customer_id, worksite_id, 
iif(emr.emission_carbon_dioxide / emr.emission_fuel_spent < isnull(ems.emission_carbon_dioxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Carbon Dioxide Compliance',
iif(emr.emission_carbon_monoxide / emr.emission_fuel_spent < isnull(ems.emission_carbon_monoxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Carbon Monoxide Compliance',
iif(emr.emission_methane / emr.emission_fuel_spent < isnull(ems.emission_methane,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Methane Compliance',
iif(emr.emission_nitrous_oxide / emr.emission_fuel_spent < isnull(ems.emission_nitrous_oxide,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Nitrous Oxide Compliance',
iif(emr.emission_other_nitrogen_oxides / emr.emission_fuel_spent < isnull(ems.emission_other_nitrogen_oxides,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Other Nitrogen Oxides Compliance',
iif(emr.emission_other_hydrocarbons / emr.emission_fuel_spent < isnull(ems.emission_other_hydrocarbons,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Other Hydrocarbons Compliance',
iif(emr.emission_particulate_matter / emr.emission_fuel_spent < isnull(ems.emission_particulate_matter,1000000), 'COMPLIANT', 'NONCOMPLIANT') as 'Particulate Matter Compliance'
from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, catproduct_id, territory_id, emr2.worksite_id as worksite_id, emr2.customer_id as customer_id
    from (select emission_id, emission_carbon_dioxide, emission_carbon_monoxide, emission_methane, emission_nitrous_oxide, emission_other_nitrogen_oxides, emission_other_hydrocarbons, emission_particulate_matter, emr1.machine_id as machine_id, catproduct_id, emr1.worksite_id as worksite_id, emr1.customer_id as customer_id
        from emission_record as emr1
        inner join machine as mac
        on emr1.machine_id = mac.machine_id) as emr2
    inner join worksite as work
    on emr2.worksite_id = work.worksite_id) as emr, em_standard as ems
where emr.catproduct_id = ems.catproduct_id
and emr.territory_id = ems.territory_id;
