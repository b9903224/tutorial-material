load moore
X = [moore(:,1:5)];
y = moore(:,6);

mdl = fitlm(X,y); % not robust
mdlr = fitlm(X,y,'RobustOpts','on');

subplot(1,2,1)
plotResiduals(mdl,'probability')
subplot(1,2,2)
plotResiduals(mdlr,'probability')

%%
x = 1:200;
X = [x', ones(size(x'))];
Y = x'*5+rand(200,1)*100;
figure, plot(x,Y), hold on

c = X\Y
plot(x, x*c(1)+c(2))

%%
coefficients = polyfit(x', Y, 1)
yFitted = polyval(coefficients, X); % yFitted will be at the 3 points where x is.  There will be 3 yFitted values.

%%
fitlm(x,Y)

%%


