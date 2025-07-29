# 🤖 Instruções para Integração de IA Real

## 📋 **RESUMO EXECUTIVO**

✅ **SIM, é possível integrar Gemini ou ChatGPT!**  
✅ **Integração simples e segura**  
✅ **Mantém funcionalidade atual como fallback**  
✅ **APIs gratuitas/baixo custo disponíveis**

---

## 🚀 **PASSO A PASSO - IMPLEMENTAÇÃO**

### **1️⃣ OBTER API KEYS**

#### 🟣 **Google Gemini (RECOMENDADO - GRATUITO)**
- 🌐 Acesse: https://makersuite.google.com/app/apikey
- 📝 Faça login com conta Google
- 🔑 Gere API Key gratuita
- 💰 **Custo**: GRATUITO até 60 requests/minuto

#### 🟢 **OpenAI ChatGPT**
- 🌐 Acesse: https://platform.openai.com/api-keys
- 📝 Crie conta OpenAI
- 💳 Adicione método de pagamento
- 💰 **Custo**: ~$0.02 por análise

---

### **2️⃣ MODIFICAÇÕES NO CÓDIGO**

#### **A) Adicionar no `<head>` do app_principal.html:**

```html
<!-- Configurações de IA -->
<script>
// Configuração da IA
const AI_CONFIG = {
    gemini: {
        apiUrl: 'https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent',
        model: 'gemini-pro'
    },
    openai: {
        apiUrl: 'https://api.openai.com/v1/chat/completions',
        model: 'gpt-3.5-turbo' // ou 'gpt-4' para análises mais avançadas
    }
};
</script>
```

#### **B) Substituir função `analyzeWithAI()` (linha ~2122):**

```javascript
// SUBSTITUIR A FUNÇÃO EXISTENTE POR ESTA:
async function analyzeWithAI() {
    if (!currentData || currentData.length === 0) {
        showToast('❌ Nenhum dado carregado para análise', 'error', 3000);
        return;
    }

    // Verificar configuração da IA
    const aiProvider = localStorage.getItem('aiProvider');
    const apiKey = localStorage.getItem('aiApiKey');
    
    if (!aiProvider || !apiKey) {
        showAISetupDialog();
        return;
    }

    showToast('🤖 Realizando análise avançada com IA...', 'info', 3000);
    
    try {
        // Preparar dados para IA
        const analysisData = prepareDataForAI();
        
        let aiInsights;
        if (aiProvider === 'gemini') {
            aiInsights = await analyzeWithGemini(analysisData, apiKey);
        } else if (aiProvider === 'openai') {
            aiInsights = await analyzeWithOpenAI(analysisData, apiKey);
        }
        
        // Combinar análise local + IA
        const localAnalysis = performAIAnalysis();
        const enhancedAnalysis = {
            ...localAnalysis,
            aiInsights: aiInsights,
            aiProvider: aiProvider,
            timestamp: new Date().toLocaleString('pt-BR')
        };
        
        displayEnhancedAIAnalysis(enhancedAnalysis);
        showToast('✅ Análise com IA concluída!', 'success', 3000);
        
    } catch (error) {
        console.error('Erro na análise:', error);
        showToast('❌ Erro na análise com IA. Usando análise local...', 'warning', 4000);
        
        // Fallback para análise local
        const localAnalysis = performAIAnalysis();
        displayAIAnalysis(localAnalysis);
    }
}
```

#### **C) Adicionar novas funções (antes da linha `</script>`):**

```javascript
// === FUNÇÕES DE IA ===

// Preparar dados para IA
function prepareDataForAI() {
    const selectedFields = getSelectedFields();
    const transactions = currentData.slice(0, 50).map(row => ({ // Limitar a 50 transações
        origem: row[selectedFields.source],
        destino: row[selectedFields.target],
        valor: parseFloat(String(row[selectedFields.value] || 0).replace(/[^\d.-]/g, '')) || 0
    })).filter(t => t.valor > 0);
    
    return {
        total_transacoes: currentData.length,
        amostra_transacoes: transactions,
        valor_total: transactions.reduce((sum, t) => sum + t.valor, 0),
        entidades_unicas: new Set([
            ...transactions.map(t => t.origem),
            ...transactions.map(t => t.destino)
        ]).size
    };
}

// Análise com Gemini
async function analyzeWithGemini(data, apiKey) {
    const prompt = `
Como especialista em análise financeira e detecção de fraudes, analise os seguintes dados de transações e forneça:

1. PADRÕES SUSPEITOS identificados
2. ENTIDADES DE ALTO RISCO
3. RECOMENDAÇÕES DE INVESTIGAÇÃO específicas
4. NÍVEL DE RISCO GERAL (Baixo/Médio/Alto)

DADOS:
${JSON.stringify(data, null, 2)}

Responda em português, formato estruturado com tópicos claros.
    `;
    
    const response = await fetch(`${AI_CONFIG.gemini.apiUrl}?key=${apiKey}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            contents: [{ parts: [{ text: prompt }] }],
            generationConfig: {
                temperature: 0.3,
                maxOutputTokens: 1500
            }
        })
    });
    
    const result = await response.json();
    if (result.candidates && result.candidates[0]) {
        return result.candidates[0].content.parts[0].text;
    }
    throw new Error('Resposta inválida da API Gemini');
}

// Análise com OpenAI
async function analyzeWithOpenAI(data, apiKey) {
    const response = await fetch(AI_CONFIG.openai.apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`
        },
        body: JSON.stringify({
            model: AI_CONFIG.openai.model,
            messages: [
                {
                    role: 'system',
                    content: 'Você é um especialista em análise financeira e detecção de fraudes. Analise dados de transações e identifique padrões suspeitos, entidades de risco e forneça recomendações específicas.'
                },
                {
                    role: 'user',
                    content: `Analise estas transações financeiras e forneça insights detalhados:\n\n${JSON.stringify(data, null, 2)}`
                }
            ],
            max_tokens: 1500,
            temperature: 0.3
        })
    });
    
    const result = await response.json();
    if (result.choices && result.choices[0]) {
        return result.choices[0].message.content;
    }
    throw new Error('Resposta inválida da API OpenAI');
}

// Dialog de configuração
function showAISetupDialog() {
    const dialog = document.createElement('div');
    dialog.id = 'aiSetupDialog';
    dialog.innerHTML = `
        <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); display: flex; justify-content: center; align-items: center; z-index: 10000;">
            <div style="background: white; padding: 30px; border-radius: 15px; max-width: 500px; width: 90%; color: #333;">
                <h3 style="margin-top: 0; color: #1d4ed8;">🤖 Configurar IA para Análises</h3>
                
                <div style="margin: 20px 0;">
                    <label style="display: block; margin-bottom: 10px;">
                        <input type="radio" name="aiProvider" value="gemini" checked> 
                        🟣 <strong>Google Gemini</strong> (Gratuito)
                    </label>
                    <label style="display: block;">
                        <input type="radio" name="aiProvider" value="openai"> 
                        🟢 <strong>OpenAI ChatGPT</strong> (Pago)
                    </label>
                </div>
                
                <div style="margin: 20px 0;">
                    <label>API Key:</label><br>
                    <input type="password" id="aiApiKeyInput" placeholder="Cole sua API key aqui" style="width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ddd; border-radius: 5px;">
                </div>
                
                <div style="text-align: center; margin-top: 25px;">
                    <button onclick="saveAIConfig()" style="background: #1d4ed8; color: white; padding: 10px 20px; border: none; border-radius: 5px; margin-right: 10px; cursor: pointer;">💾 Salvar</button>
                    <button onclick="closeAISetup()" style="background: #6b7280; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">❌ Cancelar</button>
                </div>
                
                <div style="margin-top: 20px; padding: 15px; background: #f3f4f6; border-radius: 8px; font-size: 0.9rem;">
                    <strong>📖 Como obter API Keys:</strong><br>
                    • <a href="https://makersuite.google.com/app/apikey" target="_blank">Gemini (Gratuito)</a><br>
                    • <a href="https://platform.openai.com/api-keys" target="_blank">OpenAI (Pago)</a>
                </div>
            </div>
        </div>
    `;
    document.body.appendChild(dialog);
}

function saveAIConfig() {
    const provider = document.querySelector('input[name="aiProvider"]:checked').value;
    const apiKey = document.getElementById('aiApiKeyInput').value.trim();
    
    if (!apiKey) {
        alert('⚠️ Por favor, insira uma API key válida.');
        return;
    }
    
    localStorage.setItem('aiProvider', provider);
    localStorage.setItem('aiApiKey', apiKey);
    closeAISetup();
    showToast('✅ IA configurada! Tente a análise novamente.', 'success', 3000);
}

function closeAISetup() {
    const dialog = document.getElementById('aiSetupDialog');
    if (dialog) document.body.removeChild(dialog);
}

// Display melhorado para análise com IA
function displayEnhancedAIAnalysis(analysis) {
    let analysisPanel = document.getElementById('aiAnalysisPanel');
    if (!analysisPanel) {
        analysisPanel = document.createElement('div');
        analysisPanel.id = 'aiAnalysisPanel';
        analysisPanel.className = 'ai-analysis-panel';
        document.querySelector('.main-content').appendChild(analysisPanel);
    }
    
    const aiProviderIcon = analysis.aiProvider === 'gemini' ? '🟣' : '🟢';
    const aiProviderName = analysis.aiProvider === 'gemini' ? 'Google Gemini' : 'OpenAI ChatGPT';
    
    analysisPanel.innerHTML = `
        <h4 style="margin-bottom: 20px;">
            🤖 Análise Avançada com IA Real
            <span style="float: right; font-size: 0.8rem; color: #6b7280;">
                ${aiProviderIcon} ${aiProviderName} • ${analysis.timestamp}
            </span>
        </h4>
        
        <div class="ai-insight">
            <h6>🎯 Análise Local (Automática)</h6>
            <p><strong>Entidades:</strong> ${analysis.totalEntities} | <strong>Transações:</strong> ${analysis.totalTransactions}</p>
            <p><strong>Alto Valor:</strong> ${analysis.highValueEntities.length} entidades | <strong>Hubs:</strong> ${analysis.hubEntities.length} entidades</p>
        </div>
        
        <div class="ai-insight" style="border-left-color: #10b981;">
            <h6>🧠 Insights da IA Real</h6>
            <div style="white-space: pre-wrap; line-height: 1.6;">${analysis.aiInsights}</div>
        </div>
        
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="document.getElementById('aiAnalysisPanel').style.display='none'" style="background: #6b7280; color: white; padding: 8px 16px; border: none; border-radius: 5px; cursor: pointer;">
                ✖️ Fechar Análise
            </button>
        </div>
    `;
    
    analysisPanel.style.display = 'block';
}
```

#### **D) Adicionar botão de configuração no HTML (linha ~1022, após o botão "Análise Detalhada com IA"):**

```html
<button onclick="showAISetupDialog()" class="btn-primary" style="width: 100%; margin-bottom: 8px; background: linear-gradient(135deg, #7c3aed, #5b21b6); color: white; border: none; box-shadow: 0 2px 4px rgba(124, 58, 237, 0.2);">
    <i class="fas fa-cog"></i> Configurar IA
</button>
```

---

## 🧪 **TESTE DA INTEGRAÇÃO**

### **1. Configurar IA:**
1. Obtenha API key do Gemini (gratuito)
2. Na aplicação, clique "Configurar IA"
3. Selecione "Google Gemini"
4. Cole a API key
5. Clique "Salvar"

### **2. Testar Análise:**
1. Carregue arquivo de dados
2. Configure campos (Origem, Destino, Valor)
3. Clique "Análise Detalhada com IA"
4. Aguarde resposta da IA real!

---

## 💰 **CUSTOS ESTIMADOS**

| Provedor | Custo por Análise | Limite Gratuito |
|----------|------------------|-----------------|
| **🟣 Gemini** | **GRATUITO** | 60 requests/min |
| **🟢 ChatGPT** | ~$0.02 USD | $5 crédito inicial |

**Recomendação:** Começar com **Gemini (gratuito)** para testes.

---

## 🔒 **SEGURANÇA**

✅ **API Keys armazenadas localmente** (localStorage)  
✅ **Dados limitados** enviados para IA (max 50 transações)  
✅ **Fallback automático** para análise local  
✅ **Sem armazenamento externo** de dados sensíveis  

---

## 🎯 **BENEFÍCIOS ESPERADOS**

- 🔍 **Detecção de padrões complexos** que análise local não identifica
- 📊 **Relatórios em linguagem natural** mais compreensíveis
- 🎯 **Insights específicos** por contexto dos dados
- ⚡ **Recomendações personalizadas** de investigação
- 🧠 **Análise semântica** dos nomes das entidades

---

**Status:** ✅ **PRONTO PARA IMPLEMENTAÇÃO!** 