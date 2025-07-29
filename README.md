# 🚀 InvestigIA Pro - Sistema de Análise de Grafos para Investigação

[![MercadoLibre](https://img.shields.io/badge/MercadoLibre-Corporate-blue)](https://github.com/evsalgado_meli)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live-green)](https://evsalgado_meli.github.io/InvestigIA-Pro/)
[![Version](https://img.shields.io/badge/Version-2.2.0-orange)](./versao_atualizada_sem_filtros/)

## 📋 **Visão Geral**

O **InvestigIA Pro** é uma ferramenta avançada de análise de grafos desenvolvida para investigações corporativas e análise de vínculos. Combina visualização interativa, inteligência artificial e funcionalidades robustas para análise de dados relacionais.

### 🎯 **Principais Funcionalidades**

- 📂 **Upload Multiplataforma:** CSV, Excel (.xlsx), XML
- 🎨 **Visualização Avançada:** Layouts hierárquicos, circulares, grade e concêntricos
- 🤖 **Análise com IA:** Otimização automática e insights detalhados
- 🗑️ **Exclusão Inteligente:** Sistema seguro de remoção de entidades com backup automático
- 📥 **Exportação Completa:** PNG, PDF, JSON com relatórios detalhados
- 📊 **Dashboard Interativo:** Estatísticas em tempo real e filtros avançados

## 🏢 **Contexto Corporativo - MercadoLibre**

Este projeto foi desenvolvido para atender necessidades específicas de:
- **Análise de Fraudes:** Identificação de padrões suspeitos
- **Investigação de Vínculos:** Mapeamento de relacionamentos complexos
- **Compliance:** Relatórios auditáveis e rastreabilidade
- **Business Intelligence:** Insights para tomada de decisão

## 🚀 **Quick Start**

### **1. Acesso Online**
```
https://evsalgado_meli.github.io/InvestigIA-Pro/
```

### **2. Execução Local**
```bash
# Clone o repositório
git clone https://github.com/evsalgado_meli/InvestigIA-Pro.git

# Abra a aplicação
open versao_atualizada_sem_filtros/index.html
```

### **3. Uso Básico**
1. **Upload:** Arraste seu arquivo CSV/Excel/XML
2. **Configuração:** Defina campos de Origem, Destino e Valor
3. **Análise:** Clique "Gerar Grafo" e explore
4. **Export:** Gere relatórios em PDF com análise completa

## 📊 **Funcionalidades Avançadas**

### 🗑️ **Sistema de Exclusão de Entidades**
- **Menu Contextual:** Clique direito em qualquer nó
- **Confirmação Segura:** Preview do impacto antes da exclusão
- **Backup Automático:** Máximo de 10 backups em memória
- **Desfazer (Ctrl+Z):** Sistema robusto de reversão
- **Log Auditável:** Histórico completo de todas as ações

### 🤖 **Análise com IA**
- **Detecção de Padrões:** Identificação automática de clusters
- **Otimização de Layout:** Posicionamento inteligente de nós
- **Insights Automáticos:** Relatórios gerados por IA
- **Análise Preditiva:** Identificação de relacionamentos ocultos

### 📈 **Dashboard e Relatórios**
- **Métricas em Tempo Real:** Nós, arestas, componentes
- **Filtros Dinâmicos:** Por valor, tipo, relacionamento
- **Exportação PDF:** Relatórios executivos completos
- **Histórico de Análises:** Rastreamento de sessões

## 🔧 **Instalação e Deploy**

### **GitHub Pages (Recomendado)**
```bash
# Configurar Pages no repositório
Settings > Pages > Deploy from branch > main
```

### **Docker (Produção)**
```dockerfile
FROM nginx:alpine
COPY versao_atualizada_sem_filtros/ /usr/share/nginx/html/
EXPOSE 80
```

### **Servidor Local**
```bash
# Python
python -m http.server 8000

# Node.js
npx serve versao_atualizada_sem_filtros/
```

## 📋 **Estrutura do Projeto**

```
InvestigIA-Pro/
├── versao_atualizada_sem_filtros/    # Aplicação principal
│   ├── app_principal.html             # Interface principal
│   ├── index.html                     # Página de entrada
│   └── FUNCIONALIDADE_EXCLUSAO_ENTIDADES.md
├── configurar_repo_meli.bat          # Script de configuração
├── README.md                         # Este arquivo
└── 2.0                              # Versão legada
```

## 🔒 **Segurança e Compliance**

### **Recursos de Segurança**
- ✅ **Dados Locais:** Processamento no navegador, sem envio para servidores
- ✅ **Backup Automático:** Sistema robusto de recuperação
- ✅ **Log Auditável:** Rastreamento de todas as ações
- ✅ **Validação de Dados:** Verificação de integridade

### **Compliance MercadoLibre**
- ✅ **LGPD/GDPR Ready:** Processamento local de dados
- ✅ **Auditoria:** Logs detalhados de todas as operações
- ✅ **Segurança:** Sem dependências externas críticas
- ✅ **Performance:** Otimizado para grandes volumes de dados

## 📖 **Documentação Técnica**

### **APIs e Integração**
- [Documentação de Export](./versao_atualizada_sem_filtros/DEPLOY.md)
- [Changelog](./versao_atualizada_sem_filtros/CHANGELOG.md)
- [Funcionalidade de Exclusão](./versao_atualizada_sem_filtros/FUNCIONALIDADE_EXCLUSAO_ENTIDADES.md)

### **Tecnologias Utilizadas**
- **Frontend:** HTML5, CSS3, JavaScript ES6+
- **Visualização:** D3.js, Cytoscape.js
- **IA/ML:** TensorFlow.js (análise local)
- **Export:** jsPDF, Canvas API

## 🤝 **Contribuição e Suporte**

### **Como Contribuir**
1. Fork do repositório
2. Crie uma branch: `git checkout -b feature/nova-funcionalidade`
3. Commit: `git commit -m 'Adiciona nova funcionalidade'`
4. Push: `git push origin feature/nova-funcionalidade`
5. Abra um Pull Request

### **Suporte**
- **Issues:** [GitHub Issues](https://github.com/evsalgado_meli/InvestigIA-Pro/issues)
- **Wiki:** [Documentação Completa](https://github.com/evsalgado_meli/InvestigIA-Pro/wiki)
- **Slack:** #investigia-pro (canal interno MercadoLibre)

## 📄 **Licença e Uso**

**Uso Corporativo MercadoLibre** - Todos os direitos reservados.

Para uso fora do contexto MercadoLibre, consulte a equipe de Legal/Compliance.

---

**Desenvolvido com ❤️ para o time MercadoLibre**  
**Versão:** 2.2.0 | **Atualizado:** Janeiro 2025