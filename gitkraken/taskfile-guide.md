# GitKraken CLI Taskfile Guide

This Taskfile provides comprehensive coverage of all GitKraken CLI features and workflows. It's designed to streamline your development process with predefined tasks for every GitKraken CLI command.

## Prerequisites

1. **Install Task**: [Task Installation Guide](https://taskfile.dev/installation/)
2. **Install GitKraken CLI**: [GitKraken CLI Installation](https://help.gitkraken.com/cli/cli-home/)
3. **Authenticate**: Run `task auth:login` to authenticate with GitKraken

## Quick Start

```bash
# Show all available tasks
task --list

# Check your setup
task diagnostic:check

# Start daily workflow
task workflow:daily

# Get help for specific features
task help:gk
task help:ai
task help:work
```

## Task Categories

### 🔐 Authentication & Setup

| Task | Description |
|------|-------------|
| `auth:login` | Authenticate with GitKraken platform |
| `auth:logout` | Logout from GitKraken platform |
| `auth:status` | Check authentication status |
| `setup:info` | Display system configuration |
| `version` | Show GitKraken CLI version |

**Example:**
```bash
task auth:login
task auth:status
```

### 🤖 AI Features

| Task | Description |
|------|-------------|
| `ai:commit` | Generate AI-powered commit message |
| `ai:changelog` | Generate AI-powered changelog |
| `ai:explain:commit` | AI explanation of specific commit |
| `ai:explain:branch` | AI explanation of branch changes |
| `ai:pr:create` | Create AI-generated pull request |
| `ai:tokens` | Manage AI tokens |

**Example:**
```bash
# Generate AI commit message
task ai:commit

# Explain specific commit
task ai:explain:commit COMMIT_HASH=abc123

# Explain branch changes
task ai:explain:branch BRANCH_NAME=feature/new-auth
```

### 📊 Graph Visualization

| Task | Description |
|------|-------------|
| `graph` | Display commit graph |
| `graph:oneline` | Display graph in oneline format |
| `graph:all` | Display graph for all branches |

**Example:**
```bash
task graph
task graph:oneline
task graph:all
```

### 🎯 Issue Management

| Task | Description |
|------|-------------|
| `issue:list` | List repository issues |
| `issue:assign` | Assign issue to user |

**Example:**
```bash
task issue:list
task issue:assign ISSUE_NUMBER=42 ASSIGNEE=@username
```

### 🏢 Organization Management

| Task | Description |
|------|-------------|
| `org:list` | List available organizations |
| `org:set` | Set current organization |

**Example:**
```bash
task org:list
task org:set ORG_ID=my-org-id
```

### 🔌 Provider Management

| Task | Description |
|------|-------------|
| `provider:list` | List configured providers |
| `provider:add` | Add new provider token |
| `provider:remove` | Remove provider token |
| `provider:set` | Set default provider |

**Example:**
```bash
task provider:list
task provider:add PROVIDER_TYPE=github
task provider:set PROVIDER_TYPE=gitlab
```

### 📁 Workspace Management

| Task | Description | Alias |
|------|-------------|-------|
| `workspace:list` | List all workspaces | `ws:list` |
| `workspace:create` | Create new workspace | `ws:create` |
| `workspace:clone` | Clone repository to workspace | `ws:clone` |
| `workspace:delete` | Delete workspace | `ws:delete` |
| `workspace:info` | Show workspace information | `ws:info` |
| `workspace:set` | Set current workspace | `ws:set` |
| `workspace:unset` | Unset current workspace | `ws:unset` |
| `workspace:update` | Update workspace | `ws:update` |
| `workspace:refresh` | Refresh workspace data | `ws:refresh` |

**Example:**
```bash
# Using full names
task workspace:create WORKSPACE_NAME=my-project
task workspace:clone REPO_URL=https://github.com/user/repo

# Using aliases
task ws:list
task ws:info
```

### 💼 Work Management

| Task | Description | Alias |
|------|-------------|-------|
| `work:list` | List current work items | `w:list` |
| `work:start` | Start working on issue | `w:start` |
| `work:end` | End current work session | `w:end` |
| `work:info` | Show current work info | `w:info` |
| `work:add` | Add files to current work | `w:add` |
| `work:commit` | Commit current work | `w:commit` |
| `work:push` | Push current work | `w:push` |
| `work:set` | Set work item details | `w:set` |
| `work:update` | Update work item | `w:update` |

**Example:**
```bash
# Start working on issue
task work:start ISSUE_ID=GH-123

# Add files and commit
task work:add FILES="src/*.js"
task work:commit MESSAGE="Implement new feature"

# Push work
task work:push
```

### 🔄 Pull Request Management

| Task | Description | Alias |
|------|-------------|-------|
| `work:pr:create` | Create PR for current work | `w:pr:create` |
| `work:pr:merge` | Merge PR for current work | `w:pr:merge` |

**Example:**
```bash
task work:pr:create
task work:pr:merge
```

### 🔧 MCP (Model Context Protocol)

| Task | Description |
|------|-------------|
| `mcp:install` | Install MCP server |
| `mcp:uninstall` | Uninstall MCP server |
| `mcp:start` | Start MCP server |

**Example:**
```bash
task mcp:install
task mcp:start
```

### 🏁 Shell Completion

| Task | Description |
|------|-------------|
| `completion:bash` | Generate bash completion |
| `completion:zsh` | Generate zsh completion |
| `completion:fish` | Generate fish completion |
| `completion:powershell` | Generate PowerShell completion |

**Example:**
```bash
# Install zsh completion
task completion:zsh >> ~/.zshrc
source ~/.zshrc
```

### 🚀 Workflow Combinations

| Task | Description |
|------|-------------|
| `workflow:start` | Start development workflow |
| `workflow:daily` | Daily workflow check |
| `workflow:commit` | Enhanced commit with AI |
| `workflow:pr` | Complete PR workflow |

**Example:**
```bash
# Morning startup
task workflow:start

# Daily check
task workflow:daily

# Commit with AI assistance
task workflow:commit

# Create PR
task workflow:pr
```

### 🩺 Diagnostic Tasks

| Task | Description |
|------|-------------|
| `diagnostic:check` | Comprehensive diagnostic check |

**Example:**
```bash
task diagnostic:check
```

### 📚 Help & Documentation

| Task | Description |
|------|-------------|
| `help` | Show available tasks |
| `help:gk` | GitKraken CLI help |
| `help:ai` | AI commands help |
| `help:work` | Work commands help |
| `help:workspace` | Workspace commands help |

### 🎬 Demo Tasks

| Task | Description |
|------|-------------|
| `demo:setup` | Demo complete setup |
| `demo:workflow` | Demo typical workflow |

**Example:**
```bash
task demo:setup
task demo:workflow
```

### 🎓 Advanced Features

| Task | Description |
|------|-------------|
| `advanced:explain` | AI explain current changes |
| `advanced:pr:workflow` | Complete PR workflow |

## Real-World Usage Examples

### Starting a New Feature

```bash
# 1. Check your environment
task diagnostic:check

# 2. Start work on a new issue
task work:start ISSUE_ID=PROJ-123

# 3. Make your changes...

# 4. Add and commit with AI
task work:add FILES="."
task ai:commit

# 5. Create PR with AI assistance
task ai:pr:create
```

### Daily Development Routine

```bash
# Morning routine
task workflow:start
task workflow:daily

# Check what you're working on
task work:info

# View recent changes
task graph:oneline

# During development
task ai:commit  # When ready to commit
task work:push  # Push changes

# End of day
task work:info  # Review progress
```

### Troubleshooting Workflow

```bash
# Check your setup
task diagnostic:check

# View authentication status
task auth:status

# Check workspace and work status
task workspace:info
task work:info

# View git status and graph
task git:status
task graph
```

### AI-Powered Development

```bash
# Generate commit messages
task ai:commit

# Explain complex commits
task ai:explain:commit COMMIT_HASH=abc123

# Explain branch differences
task ai:explain:branch BRANCH_NAME=feature/complex-feature

# Generate changelog
task ai:changelog

# Create PR with AI description
task ai:pr:create
```

## Customization

You can customize tasks by:

1. **Setting variables**: Most tasks accept variables for customization
2. **Creating new tasks**: Add your own tasks to the Taskfile
3. **Combining tasks**: Create workflows that combine multiple tasks

### Example Custom Task

```yaml
custom:feature:
  desc: "Custom feature development workflow"
  cmds:
    - task: work:start
      vars:
        ISSUE_ID: "{{.FEATURE_ID}}"
    - echo "Starting feature development for {{.FEATURE_ID}}"
    - task: graph:oneline
  vars:
    FEATURE_ID: '{{.FEATURE_ID | default "UNKNOWN"}}'
```

## Tips & Best Practices

1. **Use aliases**: Many tasks have short aliases (e.g., `ws:list` instead of `workspace:list`)
2. **Chain workflows**: Use the workflow tasks for common combinations
3. **Leverage AI**: Use AI tasks for better commit messages and PR descriptions
4. **Regular diagnostics**: Run `task diagnostic:check` regularly
5. **Tab completion**: Install shell completion for better UX

## Troubleshooting

**Common Issues:**

1. **Authentication errors**: Run `task auth:login`
2. **Command not found**: Ensure GitKraken CLI is installed and in PATH
3. **Workspace issues**: Check `task workspace:info` and `task workspace:refresh`
4. **Provider issues**: Verify `task provider:list` and re-add if needed

**Get Help:**
```bash
task help
task help:gk
task diagnostic:check
```

---

This Taskfile covers all documented GitKraken CLI features and provides a structured way to use them in your daily development workflow. Happy coding! 🚀
