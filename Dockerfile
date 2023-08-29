FROM openjdk:8-jdk-alpine

# تثبيت Tomcat
RUN apk add --no-cache curl tar bash
RUN cd /tmp \
    && curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz \
    && tar -xzvf apache-tomcat-8.5.69.tar.gz \
    && mv apache-tomcat-8.5.69 /usr/local/tomcat \
    && rm -rf /tmp/*

# نسخ ملف index.html إلى مجلد الويب في Tomcat
COPY index.html /usr/local/tomcat/webapps/ROOT/index.html

# تشغيل Tomcat عند بدء الحاوية
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
