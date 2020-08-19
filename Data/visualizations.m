cities = ["Napoli", "Piacenza", "Parma", "Reggio_Emilia", "Modena", "Bologna", "Rimini", "Roma", "Varese", "Como", "Milano", "Bergamo", "Brescia", "Pavia", "Cremona", "Mantova", "Lecco", "Lodi", "Monza", "Bolzano", "Torino", "Cuneo", "Alessandria", "Firenze", "Verona"];
states = ["Campagnia/Lazio/Toscana", "Emilia-Romagna", "Emilia-Romagna", "Emilia-Romagna", "Emilia-Romagna", "Emilia-Romagna", "Emilia-Romagna", "Campagnia/Lazio/Toscana", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "Lombardia", "PA Bolzano/Veneto", "Piemonte", "Piemonte", "Piemonte", "Campagnia/Lazio/Toscana", "PA Bolzano/Veneto"];
state_fig = [2, 3, 3, 3, 3, 3, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 7, 7, 7, 2, 4];
x_vars = ["daily_cases", "med_temp", "med_hum", "pm25", "home", "rt1"];
xlabels = ["Day Number", "Daily New Cases", "Median Temperature", "Median Humidity", "Median PM_{2.5}", "% Change in Home", "Median R_t"];

for i = 1:length(cities)
    current_table = readtable(strcat("Combined Data/", cities(i), ".csv"));
    
    for j = 1:length(x_vars)+1
        multiplier = 10^(j-1);
        x = 1:height(current_table);
        if j > 1
            x = current_table.(char(x_vars(j-1)));
        end
        figure(multiplier*1)
        sgtitle("All of Italy")
        subplot(3, 2, 1)
        hold on
        xlabel(xlabels(j))
        ylabel("Daily New Cases")
        plot(x, current_table.daily_cases, 'k.')

        subplot(3, 2, 2)
        hold on
        xlabel(xlabels(j))
        ylabel("Median Temperature")
        plot(x, current_table.med_temp, 'k.')

        subplot(3, 2, 3)
        hold on
        xlabel(xlabels(j))
        ylabel("Median Humidity")
        plot(x, current_table.med_hum, 'k.')

        subplot(3, 2, 4)
        hold on
        xlabel(xlabels(j))
        ylabel("Median PM_{2.5}")
        plot(x, current_table.pm25, 'k.')
        plot(70*ones(ceil(max(x)),1), 'r--')

        subplot(3, 2, 5)
        hold on
        xlabel(xlabels(j))
        ylabel("% Change in Staying at Home")
        plot(x, current_table.home, 'k.')

        subplot(3, 2, 6)
        hold on
        xlabel(xlabels(j))
        ylabel("Median R_t")
        plot(x, current_table.rt1, 'k.')


        figure(multiplier*state_fig(i))
        sgtitle(states(i))
        subplot(3, 2, 1)
        hold on
        xlabel(xlabels(j))
        ylabel("Daily New Cases")
        plot(x, current_table.daily_cases, 'k.')

        subplot(3, 2, 2)
        hold on
        xlabel(xlabels(j))
        ylabel("Median Temperature")
        plot(x, current_table.med_temp, 'k.')

        subplot(3, 2, 3)
        hold on
        xlabel(xlabels(j))
        ylabel("Median Humidity")
        plot(x, current_table.med_hum, 'k.')

        subplot(3, 2, 4)
        hold on
        xlabel(xlabels(j))
        ylabel("Median PM_{2.5}")
        plot(x, current_table.pm25, 'k.')
        plot(70*ones(max(ceil(x)),1), 'r--')

        subplot(3, 2, 5)
        hold on
        xlabel(xlabels(j))
        ylabel("% Change in Staying at Home")
        plot(x, current_table.home, 'k.')

        subplot(3, 2, 6)
        hold on
        xlabel(xlabels(j))
        ylabel("Median R_t")
        plot(x, current_table.rt1, 'k.')
       
   
    end
    
    
end

% FolderName = '/';   % Your destination folder
% FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
% for iFig = 1:length(FigList)
%   FigHandle = FigList(iFig);
%   FigName   = get(FigHandle, 'Number');
%   FigName   = num2str(FigName);
%   saveas(FigHandle, strcat(FigName, '.png'));
% end
