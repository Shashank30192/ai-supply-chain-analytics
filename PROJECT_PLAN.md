# Project Plan – AI-Driven Supply Chain Analytics

## Phase 1: Architecture & Understanding
- Understand business problem (order fulfillment issues)
- Identify data sources (email CSVs: India & USA)
- Design end-to-end architecture
  - Email → n8n → PostgreSQL → AI Analytics

## Phase 2: Data Ingestion Automation
- Configure email monitoring
- Extract CSV attachments
- Convert CSV to JSON
- Ingest data into PostgreSQL
- Handle date format inconsistencies

## Phase 3: Database Design
- Create fact and dimension tables
- Implement star schema
- Validate data consistency

## Phase 4: Analytics Setup
- Connect PostgreSQL to AI-powered analytics tool
- Load fact & dimension tables
- Create date dimension
- Create exchange rate table

## Phase 5: Data Preparation
- Clean and standardize data
- Merge fact and dimension tables
- Create final analytical dataset

## Phase 6: KPI Development
- Define supply chain KPIs
  - OTIF
  - Line Fill Rate
  - Volume Fill Rate
  - Reliability
- Validate AI-generated calculations

## Phase 7: Business Insights
- Answer business questions
- Create charts and tables
- Analyze customer and regional performance

## Phase 8: Documentation & Review
- Add screenshots
- Document KPIs and assumptions
- Reflect on AI limitations and validation
