
x = linspace(-1, 1, 100);
theta = linspace(0, 2*pi, 100);
cos1 = cos(theta);
cos2 = cos(2*theta);

% chebychev polynomials
T2 = 2.*x.^2 - 1;
T3 = 4.*x.^3 - 3.*x;

figure
tiledlayout(2,2)

% plot animation
for i = 1:length(theta)
    currentTheta = theta(i)
    
    % draw frame data to plot
    clf
    nexttile
    hold on
    plot(x, T2)     % plot chebychev curve
    line([cos1(i),cos1(i)], [-1,cos2(i)])   % vertical (input) line
    line([cos1(i),1], [cos2(i),cos2(i)])    % horizontal (output) line
    
    nexttile
    hold on
    plot(theta, cos2)
    plot(currentTheta, cos2(i), 'x')
    line([0, currentTheta], [cos2(i), cos2(i)])
    
    nexttile
    hold on
    plot(cos1, theta)
    plot(cos1(i), currentTheta, 'x')
    line([cos1(i), cos1(i)], [currentTheta, 2*pi])
    
    % force draw of frame
    drawnow
end

