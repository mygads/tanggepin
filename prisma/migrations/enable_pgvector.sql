-- Migration: Enable pgvector extension and add vector columns
-- Run this BEFORE running Prisma migrations

-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Note: The tables and columns are managed by Prisma schema
-- This script just ensures the extension is available

-- If you need to add vector columns to existing tables manually:
-- ALTER TABLE dashboard.knowledge_base ADD COLUMN IF NOT EXISTS embedding vector(768);
-- ALTER TABLE dashboard.knowledge_base ADD COLUMN IF NOT EXISTS embedding_model VARCHAR(100);
-- ALTER TABLE dashboard.knowledge_base ADD COLUMN IF NOT EXISTS last_embedded_at TIMESTAMP;

-- Create index for vector similarity search (optional but recommended for performance)
-- CREATE INDEX IF NOT EXISTS knowledge_base_embedding_idx 
--   ON dashboard.knowledge_base 
--   USING hnsw (embedding vector_cosine_ops)
--   WHERE embedding IS NOT NULL;

-- CREATE INDEX IF NOT EXISTS document_chunks_embedding_idx 
--   ON dashboard.document_chunks 
--   USING hnsw (embedding vector_cosine_ops)
--   WHERE embedding IS NOT NULL;
