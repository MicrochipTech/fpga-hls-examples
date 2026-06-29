# Additional information

## Understanding the `shls-mcp` Server

**Model Context Protocol (MCP)** is a communication protocol that allows AI models like Claude to interact with external tools, databases, and services. In this project, MCP enables Claude to:

- Access SmartHLS documentation in real-time
- Run SmartHLS commands and tools
- Retrieve context-specific information about FPGA development
- Provide intelligent code generation based on best practices

### Components of the `shls-mcp` Server

#### 1.RAG (Retrieval-Augmented Generation)

The `shls-mcp` server uses RAG to provide context-aware assistance:

- **Document Store:** Contains comprehensive SmartHLS documentation, user guides, and examples
- **Vector Database:** Stores document embeddings for efficient semantic search
- **Query Engine:** Retrieves relevant documentation snippets based on your questions

#### 2. IBM Granite Embedding Model

The system uses IBM's Granite embedding model to:

- Convert SmartHLS documentation into vector embeddings
- Perform semantic similarity searches
- Match your queries with the most relevant documentation
