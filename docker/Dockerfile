FROM mcr.microsoft.com/dotnet/sdk:7.0

EXPOSE 5000
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip
ADD ${DOWNLOAD_URL} /nop/nopCommerce_4.60.5_NoSource_linux_x64.zip

RUN apt update && apt install unzip -y && \ 
    && cd /nop && unzip nopCommerce_4.60.5_NoSource_linux_x64.zip \
    && mkdir bin logs

# https://andrewlock.net/5-ways-to-set-the-urls-for-an-aspnetcore-app/
#ENV ASPNETCORE_URLS="http://localhost:5000"

CMD [ "dotnet", "Nop.Web.dll", "--urls", "http://0.0.0.0:5000" ]




#sudo systemctl enable apache
#ExecStart command to start service