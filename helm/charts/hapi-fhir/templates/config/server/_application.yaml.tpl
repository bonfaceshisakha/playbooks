
{{- define "config.server.application.yaml" }}

spring:
  datasource:
    driverClassName: org.postgresql.Driver
    url: "jdbc:postgresql://{{ .Values.postgres.host }}:{{ .Values.postgres.port }}/{{ .Values.postgres.database }}"
    username: {{ .Values.postgres.username }}
    password: {{ .Values.postgres.password }}
    max-active: 15
  jpa:
    properties:
      hibernate.format_sql: false
      hibernate.show_sql: false
      hibernate.dialect: org.hibernate.dialect.h2dialect
      hibernate.hbm2ddl.auto: create
#      hibernate.jdbc.batch_size: 20
#      hibernate.cache.use_query_cache: false
#      hibernate.cache.use_second_level_cache: false
#      hibernate.cache.use_structured_entries: false
#      hibernate.cache.use_minimal_puts: false

       # These settings will enable fulltext search with lucene
#      hibernate.search.enabled: true
#      hibernate.search.backend.type: lucene
#      hibernate.search.backend.analysis.configurer: ca.uhn.fhir.jpa.search.HapiLuceneAnalysisConfigurer
#      hibernate.search.backend.directory.type: local-filesystem
#      hibernate.search.backend.directory.root: target/lucenefiles
#      hibernate.search.backend.lucene_version: lucene_current

  batch:
    job:
      enabled: false

hapi:
  fhir:
    ### enable to set the Server URL
#    server_address: http://hapi.fhir.org/baseR4
    ### This is the FHIR version. Choose between, DSTU2, DSTU3, R4 or R5
    fhir_version: R4
#    defer_indexing_for_codesystems_of_size: 101
    #implementationguides:
      #example from registry (packages.fhir.org)
      #swiss:
        #name: swiss.mednet.fhir
        #version: 0.8.0
      #example not from registry
      #ips_1_0_0:
        #url: https://build.fhir.org/ig/HL7/fhir-ips/package.tgz
        #name: hl7.fhir.uv.ips
        #version: 1.0.0

    #supported_resource_types:
    #  - Patient
    #  - Observation
#    allow_cascading_deletes: true
#    allow_contains_searches: true
#    allow_external_references: true
#    allow_multiple_delete: true
#    allow_override_default_search_params: true
#    allow_placeholder_references: true
#    auto_create_placeholder_reference_targets: false
#    cql_enabled: true
#    default_encoding: JSON
#    default_pretty_print: true
#    default_page_size: 20
#    enable_repository_validating_interceptor: false
#    enable_index_missing_fields: false
#    enforce_referential_integrity_on_delete: false
#    enforce_referential_integrity_on_write: false
#    etag_support_enabled: true
#    expunge_enabled: true
#    daoconfig_client_id_strategy: null
#    fhirpath_interceptor_enabled: false
#    filter_search_enabled: true
#    graphql_enabled: true
#    narrative_enabled: true
    #partitioning:
    #  allow_references_across_partitions: false
    #  partitioning_include_in_search_hashes: false
    #cors:
    #  allow_Credentials: true
      # Supports multiple, comma separated allowed origin entries
      # cors.allowed_origin=http://localhost:8080,https://localhost:8080,https://fhirtest.uhn.ca
    #  allowed_origin:
    #    - '*'

#    logger:
#      error_format: 'ERROR - ${requestVerb} ${requestUrl}'
#      format: >-
#        Path[${servletPath}] Source[${requestHeader.x-forwarded-for}]
#        Operation[${operationType} ${operationName} ${idOrResourceName}]
#        UA[${requestHeader.user-agent}] Params[${requestParameters}]
#        ResponseEncoding[${responseEncodingNoDefault}]
#      log_exceptions: true
#      name: fhirtest.access
#    max_binary_size: 104857600
#    max_page_size: 200
#    retain_cached_searches_mins: 60
#    reuse_cached_search_results_millis: 60000
    tester:

        home:
          name: Local Tester
          server_address: 'http://localhost:8080/fhir'
          refuse_to_fetch_third_party_urls: false
          fhir_version: R4

        global:
          name: Global Tester
          server_address: "http://hapi.fhir.org/baseR4"
          refuse_to_fetch_third_party_urls: false
          fhir_version: R4
#    validation:
#      requests_enabled: true
#      responses_enabled: true
#    binary_storage_enabled: true
#    bulk_export_enabled: true
#    subscription:
#      resthook_enabled: false
#      websocket_enabled: false
#      email:
#        from: some@test.com
#        host: google.com
#        port:
#        username:
#        password:
#        auth:
#        startTlsEnable:
#        startTlsRequired:
#        quitWait:
#    lastn_enabled: true
    ### This is configuration for normalized quantity serach level default is 0
    ###  0: NORMALIZED_QUANTITY_SEARCH_NOT_SUPPORTED - default
    ###  1: NORMALIZED_QUANTITY_STORAGE_SUPPORTED
    ###  2: NORMALIZED_QUANTITY_SEARCH_SUPPORTED
#    normalized_quantity_search_level: 2


#
#elasticsearch:
#  debug:
#    pretty_print_json_log: false
#    refresh_after_write: false
#  enabled: false
#  password: SomePassword
#  required_index_status: YELLOW
#  rest_url: 'localhost:9200'
#  protocol: 'http'
#  schema_management_strategy: CREATE
#  username: SomeUsername
{{- end }}