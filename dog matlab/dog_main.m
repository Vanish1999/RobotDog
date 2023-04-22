%ͨѶ��ʼ��
clear
clc
disp('Program started');
vrep=remApi('remoteApi'); 
vrep.simxFinish(-1); 
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);%�������ֵΪ-1�������ͨѶ���ɹ�������ֵΪ0����ͨѶ�ɹ�
disp(clientID);
%%
if (clientID>-1)
    disp('Connected to remote API server');
    vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot);%��ʼ����
    %�����ڵ㣬�ؽڳ�ʼ����12���ؽ�
    [rec ,rb_rot_3]=vrep.simxGetObjectHandle (clientID,'rb_rot_3',vrep.simx_opmode_blocking);
    [rec ,rf_rot_3]=vrep.simxGetObjectHandle (clientID,'rf_rot_3',vrep.simx_opmode_blocking);
    [rec ,rb_rot_2]=vrep.simxGetObjectHandle (clientID,'rb_rot_2',vrep.simx_opmode_blocking);
    [rec ,rf_rot_2]=vrep.simxGetObjectHandle (clientID,'rf_rot_2',vrep.simx_opmode_blocking);
    [rec ,rb_rot_1]=vrep.simxGetObjectHandle (clientID,'rb_rot_1',vrep.simx_opmode_blocking);
    [rec ,rf_rot_1]=vrep.simxGetObjectHandle (clientID,'rf_rot_1',vrep.simx_opmode_blocking);
    [rec ,lb_rot_3]=vrep.simxGetObjectHandle (clientID,'lb_rot_3',vrep.simx_opmode_blocking);
    [rec ,lf_rot_3]=vrep.simxGetObjectHandle (clientID,'lf_rot_3',vrep.simx_opmode_blocking);
    [rec ,lb_rot_2]=vrep.simxGetObjectHandle (clientID,'lb_rot_2',vrep.simx_opmode_blocking);
    [rec ,lf_rot_2]=vrep.simxGetObjectHandle (clientID,'lf_rot_2',vrep.simx_opmode_blocking);
    [rec ,lb_rot_1]=vrep.simxGetObjectHandle (clientID,'lb_rot_1',vrep.simx_opmode_blocking);
    [rec ,lf_rot_1]=vrep.simxGetObjectHandle (clientID,'lf_rot_1',vrep.simx_opmode_blocking);
    %12��������ز���
    rb_rot_1_force=500; rb_rot_2_force=500; rb_rot_3_force=500;  %�Һ���
    rf_rot_1_force=500; rf_rot_2_force=500; rf_rot_3_force=500;  %��ǰ��
    lb_rot_1_force=500; lb_rot_2_force=500; lb_rot_3_force=500;  %�����
    lf_rot_1_force=500; lf_rot_2_force=500; lf_rot_3_force=500;  %��ǰ��
    %12������ǶȲ���
    rb_rot_1_pos=0; rb_rot_2_pos=0; rb_rot_3_pos=0;  %�Һ���
    rf_rot_1_pos=0; rf_rot_2_pos=0; rf_rot_3_pos=0;  %��ǰ��
    lb_rot_1_pos=0; lb_rot_2_pos=0; lb_rot_3_pos=0;  %�����
    lf_rot_1_pos=0; lf_rot_2_pos=0; lf_rot_3_pos=0;  %��ǰ��
    %���õ������
    rec=vrep.simxSetJointForce(clientID, rb_rot_3,rb_rot_3_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, rf_rot_3,rf_rot_3_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, rb_rot_2,rb_rot_2_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, rf_rot_2,rf_rot_2_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, rb_rot_1,rb_rot_1_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, rf_rot_1,rf_rot_1_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lb_rot_3,lb_rot_3_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lf_rot_3,lf_rot_3_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lb_rot_2,lb_rot_2_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lf_rot_2,lf_rot_2_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lb_rot_1,lb_rot_1_force,vrep.simx_opmode_blocking);
    rec=vrep.simxSetJointForce(clientID, lf_rot_1,lf_rot_1_force,vrep.simx_opmode_blocking);
    
    %row=0;   pitch=0; yaw=0;
    %pos_x=0; pos_y=0.2; pos_z=-0.2;
    pause (1); %��ʱ1s
    t=clock; %��ȡmatlabϵͳ��ǰʱ��
    startTime=t(5)*60+t(6); %��ǰʱ��[�� �� �� ʱ �� ��]
    currentTime=0; %��ǰʱ��
    gait_state=1;  %��̬��־λ
     %[rb_x,rb_y,rb_z,rf_x,rf_y,rf_z,lb_x,lb_y,lb_z,lf_x,lf_y,lf_z]=pose_control(row,pitch,yaw,pos_x,pos_y,pos_z);
       % [lb_rot_1_pos, lb_rot_2_pos, lb_rot_3_pos]=xyz(lb_x,lb_y,lb_z);
       % [rb_rot_1_pos, rb_rot_2_pos, rb_rot_3_pos]=xyz(rb_x,rb_y,rb_z);
      %  [lf_rot_1_pos, lf_rot_2_pos, lf_rot_3_pos]=xyz(lf_x,lf_y,lf_z);
       % [rf_rot_1_pos, rf_rot_2_pos, rf_rot_3_pos]=xyz(rf_x,rf_y,rf_z);
    %%
    while (currentTime < 100)
        t=clock;
        currentTime=t(5)*60+t(6)-startTime;
        if (currentTime <5)
            if(gait_state==2)% walk��̬
                lb_x=-0.1;   rb_x=-0.1;   lf_x=0.1;    rf_x=0.1;
                lb_z=-0.482; rf_z=-0.482; lf_z=-0.482; rb_z=-0.482;
            end
            if(gait_state==1)% trotС�ܲ�̬
                lb_x=-0.1;   rb_x=0.1;   lf_x=0.1;    rf_x=-0.1;
                lb_z=-0.482; rf_z=-0.482; lf_z=-0.482; rb_z=-0.482;
            end
            [rec,vrep_time]=vrep.simxGetFloatSignal(clientID,'time',vrep.simx_opmode_oneshot);
        else
            [rec,vrep_realtime]=vrep.simxGetFloatSignal(clientID,'time',vrep.simx_opmode_oneshot);
            
            switch gait_state
                case 2 % walk��̬
                    T=1;
                    time1=vrep_realtime-vrep_time;
                    time2=vrep_realtime-vrep_time+0.25;
                    time3=vrep_realtime-vrep_time+0.5;
                    time4=vrep_realtime-vrep_time+0.75;
                    T1=mod(time1,T); T2=mod(time2,T);
                    T3=mod(time3,T); T4=mod(time4,T);
                    [lb_x,lb_z]=gait_plan2(T1,T);
                    [rf_x,rf_z]=gait_plan2(T2,T);
                    [rb_x,rb_z]=gait_plan2(T3,T);
                    [lf_x,lf_z]=gait_plan2(T4,T);
                case 1 % trotС�ܲ�̬
                    T=0.4;
                    time1=vrep_realtime-vrep_time;
                    time2=vrep_realtime-vrep_time+0.2; 
                    T1=mod(time1,T); T2=mod(time2,T);
                    [lb_x,lb_z]=gait_plan1(T1,T);
                    [rf_x,rf_z]=gait_plan1(T1,T);
                    [rb_x,rb_z]=gait_plan1(T2,T);
                    [lf_x,lf_z]=gait_plan1(T2,T);
            end
        end
        %�������˶�ѧ�� Yֵ�趨ΪĬ��ֵ
       [lb_rot_1_pos, lb_rot_2_pos, lb_rot_3_pos]=xyz(lb_x,-0.15,lb_z);
       [rb_rot_1_pos, rb_rot_2_pos, rb_rot_3_pos]=xyz(rb_x,-0.15,rb_z);
       [lf_rot_1_pos, lf_rot_2_pos, lf_rot_3_pos]=xyz(lf_x,-0.15,lf_z);
       [rf_rot_1_pos, rf_rot_2_pos, rf_rot_3_pos]=xyz(rf_x,-0.15,rf_z);
       %������ƺ���
        rec=vrep.simxSetJointTargetPosition(clientID,lb_rot_1,-lb_rot_1_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,lb_rot_2,lb_rot_2_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,lb_rot_3,lb_rot_3_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rb_rot_1,-rb_rot_1_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rb_rot_2,rb_rot_2_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rb_rot_3,rb_rot_3_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,lf_rot_1,lf_rot_1_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,lf_rot_2,lf_rot_2_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,lf_rot_3,lf_rot_3_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rf_rot_1,rf_rot_1_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rf_rot_2,rf_rot_2_pos,vrep.simx_opmode_oneshot);
        rec=vrep.simxSetJointTargetPosition(clientID,rf_rot_3,rf_rot_3_pos,vrep.simx_opmode_oneshot);
    end
    vrep.simStopSimulation(clientID,vrep.simx_opmode_blocking);%����ֹͣ
    vrep.simxDinishi(clientID);
else
    disp('Failed connecting to remote API server');
end