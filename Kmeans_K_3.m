clear all; close all; clc
% import data umur dan GlucosePlasma
% dari Tugas 3 Data Diabetes.xlsx
X = readmatrix('Tugas 3 Data Diabetes.xlsx', 'Range', 'D4:D153');
Y = readmatrix('Tugas 3 Data Diabetes.xlsx', 'Range', 'I4:I153');
X = [Y X];

% plot data mentah ke bidang x y
figure;
plot(X(:,1),X(:,2),'k*','MarkerSize',5);

% melakukan k means dengan cluster = 3
cluster = 3;
[idx,C] = kmeans(X,cluster);

figure;
plot(X(idx==1,1),X(idx==1,2),'r*','MarkerSize',5)
hold on
plot(X(idx==2,1),X(idx==2,2),'b*','MarkerSize',5)
hold on
plot(X(idx==3,1),X(idx==3,2),'g*','MarkerSize',5)
plot(C(:,1), C(:,2),'kx', 'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids','Location','NW')
xlabel('Age')
ylabel('Glucose Plasma')
title 'Cluster Assignments and Centroids'
hold off