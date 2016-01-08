function reshapecontour(data,labelx,labely,pathname,text1)
%contour plot z in the xy plane.

x=unique(data(:,1));y=unique(data(:,2));
[m1, ~]=size(x);[n1, ~]=size(y);
Z=reshape(data(:,3),n1,m1);
figure
contourf(x,y,Z,30,'LineStyle','none');
% imagesc(x,y,Z);
colorbar
xlabel(labelx,'FontSize',36,'Interpreter','tex')
ylabel(labely,'FontSize',36,'Interpreter','tex');
grid on
set(gca,'FontName','Times New Roman','FontSize',28)
axis equal;
set(gcf,'PaperSize',[16 16],'PaperPosition',[0.3, 0.3, 15, 15])
title(text1);
saveas(gcf, [pathname,'.pdf']);
dlmwrite([pathname '.txt'],data,'delimiter', '\t');
end