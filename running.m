% % % task 1
% 
% % Temperature profile
% 
% beta=15;
% T0=56.2; %intial temperature
% time=(0:1/60:10);
% for n=1:length(time)
%     T(n)=T0-beta*(time(n));
%     if T(n)<5;
%         T(n)=5;
%     end
% end
% plot(time,T); 
% xlabel('Time');ylabel('Temperature');title('Temperature Profile')
% 
% %physical properties profile
% time=(0:1/60:10);
% [u0,u1,u2,u3,u4,C0]=rk4(600);
% 
% figure
% subplot(1,3,1)
% plot(time,u0);
% xlabel('time (hr)');ylabel('number of crystals');title('u0 versus time');
% 
% subplot(1,3,2)
% plot(time,u1)
% xlabel('time (hr)');ylabel('size of crystals');title('u1 versus time');
% 
% subplot(1,3,3)
% plot(time,u2)
% xlabel('time (hr)');ylabel('surface area of crystals');title('u2 versus time');
% 
% figure
% subplot(1,2,1)
% plot(time,u3)
% xlabel('time (hr)');ylabel('volume of crystals');title('u3 versus time');
% 
% subplot(1,2,2)
% plot(time,u4)
% xlabel('time (hr)');ylabel('u4');title('u4 versus time');
% 
% figure
% satconc=csat(T);
% plot(time,satconc);
% hold on
% plot(time,C0)
% xlabel('time (hr)');ylabel('concentration of crystals');title('concentration versus time');
% legend('saturation curve','Concentration (task 1)');
% hold off
% 
% data = importdata('concentration_profile_for_group_14.txt');
% ref = data(:,2)';
% SSEmin = inf;
% n = 1;
% for k = -7.5:-0.1:-16
%     [SSE(n),Cnew(n,:)] = findminSSE(exp(k),ref);
%     if SSEmin>SSE(n)
%         SSEmin = SSE(n);
%         kgnew = exp(k);
%         knew = k;
%         Cneww = Cnew(n,:);
%     end
%     n = n+1;
% end
% SSEmin;
% kgnew;
% knew;
% Cneww;
% 
% 
% 
% figure
% subplot(1,2,1)
% plot(time,ref);
% xlabel('time (hours)');ylabel('Concentration (ref)');title('Before Optimization')
% subplot(1,2,2)
% plot(time,Cneww,'b')
% xlabel('time (hours)');ylabel('Concentration ');title('After Optimization')
% satconc=csat(T);
% 
% figure
% plot(time,C0);
% hold on
% plot(time,Cneww,'r')
% xlabel('time (hrs)');ylabel('Concentration'); title('Concentration versus time');
% legend('Concentration (task 1)','Concentration (task 2)');
% hold off
% 
% figure
% plot(T,satconc,'k');
% hold on
% plot(T,Cneww,'b');
% xlabel('temperature (degC)');ylabel('concentration');title('concentration versus temperature');
% plot(T,C0,'r');
% axis([0 56.2 0.005 0.045]);
% legend('saturated concentration','Concentration (task 2)','Concentration (task 1)');
% hold off
% 
% %Task 3
% for b=[1:0.5:30]'
%     T3=temperature3(b);
% end
% 
% for r1=1:size(T3,1)
%     for c=1:size(T3,2);
%         if T3(r1,c)<5
%             T3(r1,c)=5;
%         end
%     end
% end
% time=0:1/60:10;
% colorVec = hsv(59);
% hold on
% for r=1:size(T3,1)
%     plot(time,T3(r,:))
%     xlabel('time (hrs)');ylabel('Temperature (degC)');title('Temperature versus time');
% end
% hold off
% 
% saturatedconc3=csat(T3);
% time=0:1/60:10;
% colorVec = hsv(59);
% hold on
% for d=1:size(saturatedconc3,1)
%     plot(time,saturatedconc3(d,:))
%     xlabel('time (hrs)');ylabel('Saturated Concentration');title('Saturated Concentration versus time');
% end
% hold off

concentration3=task3rk4(C0)

