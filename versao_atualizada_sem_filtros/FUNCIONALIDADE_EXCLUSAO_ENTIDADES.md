# 🗑️ Funcionalidade: Exclusão de Entidades do Grafo

## 📋 **Visão Geral**

A funcionalidade de **Exclusão de Entidades** permite remover nós (entidades) diretamente do grafo de forma intuitiva e segura, ideal para análise de vínculos e investigação onde entidades irrelevantes ou duplicadas precisam ser descartadas.

## ✅ **Funcionalidades Implementadas**

### 🎯 **Menu de Contexto**
- **Ativação:** Clique com botão direito em qualquer nó do grafo
- **Opções disponíveis:**
  - 👁️ **Destacar Conexões** - Realça todas as conexões da entidade
  - 🔍 **Filtrar Entidade** - Filtra transações relacionadas à entidade
  - 🗑️ **Excluir Entidade** - Remove a entidade e suas conexões

### 🔒 **Sistema de Segurança**

#### **1. Confirmação Obrigatória**
- Modal detalhado antes da exclusão
- Preview do impacto da remoção:
  - Número de conexões que serão removidas
  - Entidades relacionadas que serão afetadas
  - Estatísticas antes e depois da exclusão

#### **2. Backup Automático**
- Backup criado automaticamente antes de cada exclusão
- Máximo de **10 backups** mantidos em memória
- Cada backup inclui:
  - Timestamp da ação
  - Descrição da ação realizada
  - Estado completo do grafo
  - Estatísticas (nós e arestas)

#### **3. Sistema de Desfazer (Ctrl+Z)**
- **Atalho:** `Ctrl + Z`
- Desfaz a última ação realizada
- Restaura completamente o estado anterior
- Funciona globalmente na aplicação

### 📊 **Log de Exclusões**

#### **Acesso**
- **Localização:** Controles Avançados > "Log de Exclusões"
- **Botão:** Roxo com ícone de histórico

#### **Informações Registradas**
- **Timestamp** da exclusão
- **Nome da entidade** removida
- **Estatísticas detalhadas:**
  - Conexões removidas
  - Entidades afetadas
  - Estado do grafo antes/depois
- **ID do backup** relacionado

#### **Funcionalidades do Log**
- Visualização cronológica de todas as exclusões
- Estatísticas consolidadas (total de exclusões e backups)
- Opção de limpar todo o log
- Interface visual intuitiva

## 🎮 **Como Usar**

### **Passo 1: Abrir Menu de Contexto**
1. Gere um grafo na aplicação
2. **Clique com botão direito** em qualquer nó
3. O menu de contexto aparecerá próximo ao cursor

### **Passo 2: Escolher Ação**
- **Destacar Conexões:** Visualizar relacionamentos sem remover
- **Filtrar Entidade:** Ver apenas transações relacionadas
- **Excluir Entidade:** Remover definitivamente

### **Passo 3: Confirmar Exclusão**
1. Clique em "Excluir Entidade"
2. **Revise o impacto** mostrado no modal:
   - Conexões que serão removidas
   - Entidades que serão afetadas
3. Clique em **"EXCLUIR"** para confirmar
4. Ou **"Cancelar"** para abortar

### **Passo 4: Acompanhar Resultado**
- Toast de confirmação com estatísticas
- Layout do grafo reorganizado automaticamente
- Backup criado automaticamente

### **Desfazer (se necessário)**
- Pressione **`Ctrl + Z`** para desfazer
- Ou acesse "Log de Exclusões" para ver histórico

## 🔧 **Detalhes Técnicos**

### **Segurança Implementada**
- ✅ **Backup automático** antes de cada ação
- ✅ **Confirmação obrigatória** com preview
- ✅ **Log auditável** de todas as exclusões
- ✅ **Sistema de desfazer** robusto
- ✅ **Prévia visual** do que será removido

### **Performance**
- ✅ **Layout otimizado** após exclusão
- ✅ **Animações suaves** (1 segundo)
- ✅ **Gerenciamento de memória** (máx. 10 backups)
- ✅ **Operações assíncronas** não bloqueantes

### **Compatibilidade**
- ✅ **Cross-browser** (Chrome, Firefox, Safari, Edge)
- ✅ **Responsivo** (Desktop e Mobile)
- ✅ **Acessibilidade** (navegação por teclado)

## ⚠️ **Limitações e Cuidados**

### **Limitações**
- Máximo de **10 backups** simultâneos
- Exclusões não persistem entre sessões
- Backup apenas em memória (não salvo em arquivo)

### **Cuidados Recomendados**
1. **Sempre revisar** o impacto antes de confirmar
2. **Usar backup de dados** antes de grandes limpezas
3. **Testar com dados de exemplo** primeiro
4. **Verificar conexões** antes de excluir entidades centrais

## 🎯 **Casos de Uso Ideais**

### **1. Análise de Vínculos**
- Remover entidades irrelevantes para focar em alvos principais
- Limpar grafos com muitos nós para melhor visualização
- Isolar clusters específicos de relacionamentos

### **2. Investigação**
- Excluir entidades duplicadas ou com erro
- Remover "ruído" de dados para análise mais clara
- Focar em suspeitos específicos

### **3. Apresentação**
- Preparar grafos limpos para relatórios
- Destacar apenas relacionamentos relevantes
- Criar visualizações focadas por público

## 📈 **Estatísticas e Métricas**

O sistema rastreia automaticamente:
- **Total de exclusões** realizadas
- **Número de backups** disponíveis
- **Conexões removidas** por exclusão
- **Entidades afetadas** por ação
- **Timestamp** de todas as operações

## 🆘 **Resolução de Problemas**

### **"Menu não aparece"**
- Certifique-se de clicar com **botão direito**
- Aguarde o grafo carregar completamente
- Tente em outro nó

### **"Não consigo desfazer"**
- Verifique se há backups disponíveis
- Use `Ctrl + Z` (não `Ctrl + Shift + Z`)
- Máximo de 10 ações podem ser desfeitas

### **"Exclusão muito lenta"**
- Normal em grafos grandes (>100 nós)
- Aguarde a animação de layout terminar
- Evite múltiplas exclusões simultâneas

## 🔮 **Próximas Melhorias**

### **Planejadas**
- [ ] Exclusão múltipla (seleção por área)
- [ ] Salvar/carregar estado do grafo
- [ ] Filtros avançados antes da exclusão
- [ ] Exportar log de exclusões

### **Consideradas**
- [ ] Exclusão por critérios (valor, tipo, etc.)
- [ ] Grupos de exclusão (templates)
- [ ] Integração com análise de IA
- [ ] Modo "Sandbox" para testes

---

## 📞 **Suporte**

Para dúvidas ou problemas com esta funcionalidade:
1. Verifique o console do navegador (F12) para logs detalhados
2. Teste em navegador anônimo para descartar cache
3. Reporte bugs com capturas de tela e passos para reproduzir

**Data de implementação:** Janeiro 2025  
**Versão:** 2.2.0 - Sistema de Exclusão de Entidades 