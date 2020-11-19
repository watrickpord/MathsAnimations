
x = linspace(-1, 1, 50);
theta = linspace(0, 2*pi, 50);
cos1 = cos(theta);
cos2 = cos(2*theta);

% chebychev polynomials
T2 = 2.*x.^2 - 1;
T3 = 4.*x.^3 - 3.*x;

figure

tiledlayout(2,2)

% plot animation
for i = 1:length(theta)
    currentTheta = theta(i);
    
    % draw frame data to plot
    clf
    nexttile
    hold on
    xlabel('x')
    ylabel('T_2(x)')
    plot(x, T2, 'r')     % plot chebychev curve
    lVert = line([cos1(i),cos1(i)], [-1,cos2(i)]);   % vertical (input) line
    lHorz = line([cos1(i),1], [cos2(i),cos2(i)]);    % horizontal (output) line
    lVert.Color = [0.1 0.1 0.1]; lHorz.Color = [0.1 0.1 0.1];
    lVert.LineStyle = '--'; lHorz.LineStyle = '--';
    
    nexttile
    hold on
    ylabel('cos(2\theta)')
    xlabel('\theta')
    plot(theta, cos2)
    plot(currentTheta, cos2(i), 'kx')
    lOut = line([0, currentTheta], [cos2(i), cos2(i)]);
    lOut.Color = [0.1 0.1 0.1]; lOut.LineStyle = '--';
    
    nexttile
    hold on
    xlabel('cos(\theta)')
    ylabel('\theta')
    plot(cos1, theta)
    plot(cos1(i), currentTheta, 'kx')
    lIn = line([cos1(i), cos1(i)], [currentTheta, 2*pi]);
    lIn.Color = [0.1 0.1 0.1]; lIn.LineStyle = '--';
    
    % force draw of frame
    drawnow
end

