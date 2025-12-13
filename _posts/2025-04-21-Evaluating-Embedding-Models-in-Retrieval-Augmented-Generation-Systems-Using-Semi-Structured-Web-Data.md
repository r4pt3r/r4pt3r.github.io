---
layout: post
title: "Evaluating Embedding Models in Retrieval-Augmented Generation Systems Using Semi-Structured Web Data"
description: "An applied research project exploring how MiniLM, BGE, and E5 embeddings affect retrieval precision in real-world RAG pipelines grounded on noisy web content."
date: 2025-04-21
tags: [RAG, embeddings, NLP, LLMs, applied-research, vector-databases, semantic-search]
keywords: retrieval augmented generation, rag systems, embedding models, semantic retrieval, rag evaluation, embedding model comparison, MiniLM, BGE, E5 embeddings, vector databases, chromadb, rag metrics, faithfulness evaluation, answer relevancy, ragas, semi structured web data, local rag pipeline, open source rag framework
comments: true
---

## Introduction

Retrieval-Augmented Generation (RAG) has become a foundational architecture for building reliable, factual, and domain-aware AI systems. By combining semantic retrieval with large language models (LLMs), RAG systems mitigate hallucinations and overcome the static knowledge limitations of standalone generative models.

However, while much attention is given to LLM selection, **embedding models used during retrieval are often treated as interchangeable components**. In practice, this assumption breaks down, especially when RAG systems operate on **semi-structured, noisy web data rather than clean benchmark datasets**.

This project investigates a central question:

> **How do different embedding models affect retrieval precision in RAG systems grounded on semi-structured web data?**

To answer this, I designed and implemented a **fully local, modular RAG evaluation framework**, and conducted a controlled comparative study of three widely used open-source embedding models: **MiniLM, BGE, and E5**.

---

## Why Semi-Structured Web Data Matters

Most embedding benchmarks rely on datasets such as SQuAD or Natural Questions. These datasets are:
- Clean
- Well-structured
- Carefully curated

In contrast, real-world RAG systems frequently ingest:
- Blog posts
- Documentation pages
- HTML-rich content
- Inconsistent formatting
- Fragmented semantics

Embedding models that perform well on benchmarks may degrade significantly when exposed to this type of data. This gap between **benchmark performance and production reality** was the primary motivation for this research.

---

## Research Objectives

The project was guided by the following objectives:

1. Design a **modular RAG evaluation pipeline** supporting interchangeable embedding models.
2. Evaluate **MiniLM, BGE, and E5** under identical retrieval and generation conditions.
3. Ingest and process **semi-structured web content** representative of real-world noise.
4. Apply a **multi-metric evaluation framework**, including:
   - Faithfulness  
   - Answer relevancy  
   - Context precision  
   - ROUGE  
   - BERTScore  
   - Semantic similarity  
   - RAGAS
5. Validate findings using **statistical significance testing** and **effect size analysis**.
6. Produce **practical recommendations** for embedding model selection in applied RAG systems.

---

## System Architecture Overview

The evaluation framework was implemented as a **local-first, open-source RAG pipeline**, designed for transparency and reproducibility.

### Core Components

- **Data Ingestion**
  - Custom Python crawler
  - Robots.txt compliant
  - HTML cleaning with BeautifulSoup
  - Semantic chunking

- **Embedding Layer**
  - MiniLM (lightweight, fast)
  - BGE (balanced performance)
  - E5 (QA-optimised, high semantic depth)

- **Vector Storage**
  - ChromaDB
  - Independent collections per embedding model

- **Retrieval**
  - Cosine similarity
  - Top-k semantic search

- **Generation**
  - Local TinyLLaMA via Ollama
  - Strict grounding prompts

- **Evaluation**
  - Automated metric computation
  - Composite scoring
  - Statistical testing

- **Interface**
  - Streamlit dashboard
  - Side-by-side model comparison
  - Interactive visual analytics

This modular design allows embedding models to be swapped without affecting downstream components, ensuring fair comparison.

---

## Embedding Models Evaluated

### MiniLM
- Optimised for speed and efficiency
- Low memory footprint
- Performs well in lightweight similarity tasks

### BGE
- Balanced trade-off between accuracy and latency
- Designed for both query and document embeddings
- Strong general-purpose performance

### E5
- Contrastive learning with QA-focused objectives
- Higher computational cost
- Optimised for semantic alignment in question-answering scenarios

---

## Evaluation Metrics

RAG performance cannot be captured by a single metric. This project used a **multi-dimensional evaluation strategy**:

### RAG-Specific Metrics
- **Faithfulness**: Are generated claims supported by retrieved context?
- **Answer Relevancy**: Does the answer address the query intent?
- **Context Precision**: Are retrieved documents topically relevant?

### Text Similarity Metrics
- ROUGE-1 / ROUGE-2 / ROUGE-L
- BERTScore
- Jaccard similarity
- Semantic similarity using SBERT

### Composite Metrics
- **RAGAS**, combining grounding, relevance, and fluency

All metrics were computed locally and aggregated into a **composite score** for interpretable ranking.

---

## Experimental Design

Two evaluation modes were used:

1. **Single-Query Analysis**
   - Deep inspection of retrieved context
   - Per-metric breakdown
   - Qualitative comparison of model behaviour

2. **Batch Evaluation**
   - 10 diverse, manually curated queries
   - Aggregate performance comparison
   - Statistical validation

To ensure rigor:
- **Paired t-tests** assessed statistical significance
- **Wilcoxon signed-rank tests** handled non-normal distributions
- **Cohen’s d and Glass’s delta** quantified effect sizes

---

## Key Findings

### Overall Performance Ranking

1. **E5** – Highest semantic alignment and faithfulness  
2. **BGE** – Strong balance between accuracy and speed  
3. **MiniLM** – Fastest, but least robust on noisy data  

### Observed Behaviour

- **MiniLM**
  - Excellent latency
  - Struggles with abstraction and multi-hop reasoning
  - Sensitive to noise in semi-structured content

- **BGE**
  - Consistent and stable across queries
  - Good compromise for production systems
  - Lower latency than E5 with modest accuracy trade-off

- **E5**
  - Superior contextual grounding
  - Best faithfulness and relevancy scores
  - Slower inference, but statistically significant performance gains

Statistical tests confirmed that E5’s improvements over MiniLM and BGE were **both statistically and practically significant**.

---

## Why Benchmarks Are Not Enough

A critical insight from this research is that **embedding performance is highly context-dependent**.

MiniLM performs competitively on clean datasets, but degrades on semi-structured web data. E5’s QA-centric training allows it to generalise better under noisy conditions. This reinforces the idea that **embedding models must be evaluated within full RAG pipelines**, not in isolation.

---

## Practical Recommendations

Based on the results:

- **Use E5** when:
  - Accuracy and faithfulness are critical
  - Domains include legal, medical, or academic QA
  - Latency is a secondary concern

- **Use BGE** when:
  - Balanced performance is required
  - Systems operate under moderate latency constraints
  - General-purpose retrieval is sufficient

- **Use MiniLM** when:
  - Speed and resource efficiency dominate
  - Use cases are simple or low-risk
  - Hardware constraints are severe

---

## Limitations and Future Work

### Limitations
- Only three embedding models evaluated
- Batch size limited to 10 queries
- English-only content
- Local TinyLLaMA limits generation quality
- No reranking or hybrid retrieval strategies

### Future Directions
- Evaluate additional embeddings (GTE, MPNet, Ada)
- Increase query volume for stronger statistical power
- Integrate cross-encoder rerankers
- Extend to multilingual and domain-specific corpora
- Add human evaluation for qualitative validation

---

## Closing Thoughts

This project demonstrates that **embedding model selection is a first-order design decision in RAG systems**, not a minor configuration detail. When operating on realistic, semi-structured web data, embedding choice significantly impacts retrieval quality, answer faithfulness, and system reliability.

By building a **modular, reproducible evaluation framework** and grounding experiments in real-world data conditions, this research bridges the gap between academic benchmarking and applied AI deployment.

The framework is intentionally extensible and can serve as a foundation for future RAG experimentation, production evaluation, and research-driven system design.

---

*This blog post is based on my MSc Applied Research Project submitted to Dublin Business School, August 2025.*