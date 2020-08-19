clear

cities = ["Napoli", "Piacenza", "Parma", "Reggio_Emilia", "Modena", "Bologna", "Rimini", "Roma", "Varese", "Como", "Milano", "Bergamo", "Brescia", "Pavia", "Cremona", "Mantova", "Lecco", "Lodi", "Monza", "Bolzano", "Torino", "Cuneo", "Alessandria", "Firenze", "Verona"];
infection_table = readtable("italy_covid_data.csv");
mobility_table = readtable("italy_mobility_report.csv");
rt2_table = readtable("Rt2/Data/Rt2.csv");
for city_idx = 1:length(cities)
    output_table = infection_table(:,1); %make a new table with just the date 
    
    output_table.daily_cases = infection_table.(char(cities(city_idx)));
    
    noaa_table = readtable(strcat("NOAA Data/Data/",cities(city_idx),".csv"));
    output_table = outerjoin(output_table, noaa_table,'Type','left', 'MergeKeys', true);
    
    aq_table = readtable(strcat("AQ Data/Data/", cities(city_idx), ".csv"));
    output_table = outerjoin(output_table, aq_table,'Type','left', 'MergeKeys', true);

    city_mobility = mobility_table(mobility_table.city == cities(city_idx),:);
    city_mobility = city_mobility(:,2:end);
    output_table = outerjoin(output_table, city_mobility,'Type','left', 'MergeKeys', true);
    
    rt1_table = readtable(strcat("Rt1/data/", cities(city_idx), ".csv"));
    rt1_table.rt1 = rt1_table.mean;
    rt1_table = rt1_table(:, [1, 6, end]);
    output_table = outerjoin(output_table, rt1_table,'Type','left', 'MergeKeys', true);
    
    date = rt2_table.date;
    rt2 = (rt2_table.(char(cities(city_idx))));
    rt2_city_table = table(date, rt2);
    output_table = outerjoin(output_table, rt2_city_table,'Type','left', 'MergeKeys', true);
    if cities(city_idx) == "Bolzano"
        output_table = output_table(4:end, :);
    end
    
    writetable(output_table, strcat("Combined Data/", cities(city_idx), ".csv"));
end



            