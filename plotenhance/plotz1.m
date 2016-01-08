function plotz1(x,y1,y2,labelx,labely,legend1,legend2,pathname)
%PLOTZ1 Plot a figure for scientific paper in right size with all figure elements.
%   The function plot and save the figure;
%
%   See also: savez1
%%Plot
        figure;
        plot(x,y1,'-r',x,y2,'--b','LineWidth',2)
        xlabel(labelx,'FontSize',48)
        ylabel(labely,'FontSize',48);
        grid on
        h = legend(legend1,legend2,1);
        set(h,'Interpreter','tex');
        set(gca,'FontName','Times New Roman','FontSize',36)
        set(gcf,'PaperSize',[21 16],'PaperPosition',[0.6, 0.6, 20, 15])
%         title('lifetime');
%         fig3lifetimeonsurface=[zn;tauxx.';tauzz.'];
%         fig3lifetimeonsurfacenm=fig3lifetimeonsurface.';
%         dlmwrite('D:\mywork\zhoulm\NVonSurface\fig\fig3lifetimeonMetalnm.txt',...
%           fig3lifetimeonMetalnm, 'delimiter', '\t');
        saveas(gcf, pathname);
end