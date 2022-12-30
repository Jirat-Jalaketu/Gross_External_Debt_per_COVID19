c = [1:5];
Th = table2array(TH);
Aver = table2array(Average);
avgTh = mean(Th); avgAver = mean(Aver);
k = 0.5 %ความน่าเชื่อถือ ของนานาชาติ
upper = avgTh*(1+k); lower = avgTh*(1-k);
plot(c,Th)
hold on
plot(c,Aver)
fplot(avgTh,[1 5],'r'); fplot(avgAver,[1 5])
fplot(upper,[1 5],'r--'); fplot(lower,[1 5],'r--');
legend('Th','Average','mean Th','mean Average')
ylabel('debt per covid'); xlabel('q time')
%%
ct = 'Thailand'; N = 76;
ct1name = importname("C:\Users\Jirat Jalaketu\OneDrive\เดสก์ท็อป\My Study\Homework\second year\Prob Stat for EE\project\Main_data.xlsx", "Sheet1", [3, 79]);
for i = 1:N;
    tf = strcmp(ct,ct1name(i));
    if tf == 1;
        order = i;
    end
end

dpc = importcovid("C:\Users\Jirat Jalaketu\OneDrive\เดสก์ท็อป\My Study\Homework\second year\Prob Stat for EE\project\Main_data.xlsx", "Sheet1", [3, 79])
ct1dpc1 = dpc(i,1:5)
