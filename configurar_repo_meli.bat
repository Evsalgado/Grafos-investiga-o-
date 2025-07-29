@echo off
echo ========================================
echo 🚀 CONFIGURADOR InvestigIA -FIRPA - MELI
echo ========================================
echo.

echo 📋 INSTRUÇÕES:
echo 1. Acesse: https://github.com/evsalgado_meli
echo 2. Faça login com SSO do MercadoLibre
echo 3. Clique no + e "New repository"
echo 4. Nome sugerido: InvestigIA-Pro
echo 5. Descrição: Sistema de Análise de Grafos para Investigação com IA
echo 6. Execute este script após criar o repositório
echo.

set /p repo_name="Digite o nome do repositório criado (ex: InvestigIA-Pro): "

echo.
echo 🔄 Configurando repositório...

git remote set-url origin https://github.com/evsalgado_meli/%repo_name%.git

echo.
echo 📤 Enviando código para o repositório...

git push -u origin main

echo.
echo ✅ CONFIGURAÇÃO CONCLUÍDA!
echo.
echo 🌐 URLs de acesso:
echo - Repositório: https://github.com/evsalgado_meli/%repo_name%
echo - GitHub Pages: https://evsalgado_meli.github.io/%repo_name%/
echo.
echo 📝 Para ativar GitHub Pages:
echo 1. Acesse o repositório
echo 2. Settings → Pages
echo 3. Source: Deploy from a branch → main
echo 4. Save
echo.

pause 