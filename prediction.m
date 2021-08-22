function [y_predicted] = prediction(correlation)
    a = -191.5598;
    b = 441.8731;
    y_predicted = a + b * correlation;
    fprintf("Patient's Total Cholesterol value is %f \n",y_predicted);
    disp("Cholesterol Value = ");
    if y_predicted < 200
        disp("Nomal Range");
    elseif y_predicted >= 200 && y_predicted <= 240
        disp("Risk of Cholesterol");
    else 
        disp("High Cholesterol");
    end
end