# Инструкция по пушу в GitHub

## Шаг 1: Инициализация репозитория

```bash
cd /Users/ilaledackov/Desktop/webSCADA/web-scada-showcase
git init
```

## Шаг 2: Добавление файлов

```bash
git add .
```

## Шаг 3: Первый коммит

```bash
git commit -m "Initial showcase: architecture docs, diagrams, ADRs, demo schemas"
```

## Шаг 4: Подключение к GitHub

```bash
git branch -M main
git remote add origin https://github.com/qomad13/web-scada-showcase.git
```

## Шаг 5: Пуш

```bash
git push -u origin main
```

---

## Если репозиторий уже существует (и пустой)

Если на GitHub уже есть пустой репозиторий, выполни:

```bash
git remote add origin https://github.com/qomad13/web-scada-showcase.git
git branch -M main
git push -u origin main
```

## Если нужно перезаписать (осторожно!)

Если на GitHub уже есть файлы и ты хочешь их заменить:

```bash
git push -u origin main --force
```

⚠️ **Внимание:** `--force` перезапишет все существующие файлы на GitHub!

---

## Проверка перед пушем

Перед пушем проверь, что нет секретов:

```bash
# Поиск потенциальных секретов
grep -r "password\|secret\|token\|key" --include="*.md" --include="*.sql" --include="*.yml" | grep -v "CHANGE_ME\|example\|TODO"

# Поиск IP адресов
grep -rE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" --include="*.md" --include="*.yml"
```

Если ничего не нашлось — можно пушить!

---

## После пуша

1. **Открой репозиторий:** https://github.com/qomad13/web-scada-showcase
2. **Проверь README:** должен рендериться корректно
3. **Проверь диаграммы:** Mermaid диаграммы должны отображаться
4. **Добавь описание:** в настройках репозитория добавь краткое описание
5. **Добавь topics:** `scada`, `realtime`, `multitenancy`, `nestjs`, `react`, `portfolio`

---

## Если что-то пошло не так

### Ошибка "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/qomad13/web-scada-showcase.git
```

### Ошибка аутентификации
Убедись, что у тебя настроен GitHub CLI или SSH ключи:
- **HTTPS:** используй Personal Access Token
- **SSH:** используй SSH ключи

### Откатить последний коммит (если нужно)
```bash
git reset --soft HEAD~1  # Откатить коммит, оставить изменения
git reset --hard HEAD~1   # Откатить коммит и удалить изменения (осторожно!)
```

