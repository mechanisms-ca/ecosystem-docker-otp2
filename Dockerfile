FROM openjdk:11-jre-slim
LABEL maintainer="Nathan Schepers <nathan.schepers@protonmail.com>"

ENV OTP_VERSION=2.1.0
ENV JAVA_OPTIONS=-Xmx1G

ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /usr/local/share/java/

RUN ln -s otp-$OTP_VERSION-shaded.jar /usr/local/share/java/otp.jar

COPY otp /usr/local/bin/

EXPOSE 8080

ENTRYPOINT ["otp"]
CMD ["--help"]
