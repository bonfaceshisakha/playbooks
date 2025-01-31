
{{- define "config.opensrp.context.xml" }}
<Context>
<Resource
  name="jdbc/openSRPDB"
  auth="Container"
  type="javax.sql.DataSource"
  factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"
  initialSize="5"
  maxActive="55"
  maxIdle="21"
  minIdle="13"
  timeBetweenEvictionRunsMillis="34000"
  minEvictableIdleTimeMillis="55000"
  validationQuery="SELECT 1"
  validationInterval="34"
  testOnBorrow="true"
  removeAbandoned="true"
  removeAbandonedTimeout="233"
  username="{{ .Values.postgres.username }}"
  password="{{ .Values.postgres.password }}"
  driverClassName="org.postgresql.Driver"
  url="jdbc:postgresql://{{ .Values.postgres.host }}:{{ .Values.postgres.port }}/{{ .Values.postgres.database }}"
    />
</Context>
{{- end }}
