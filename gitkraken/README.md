# GitKraken & GitLens Developer Workflow Guide

Welcome to the comprehensive guide on leveraging GitKraken CLI and GitLens to supercharge your Git workflow!

## 🎯 What You'll Learn

This documentation covers essential developer workflow optimizations using:

- **GitKraken CLI** - Powerful command-line Git operations
- **GitLens** - Rich VS Code Git integration with visual tools
- **Interactive Rebase** - Clean up commit history like a pro
- **Graph Visualization** - Understand complex branch relationships

## 🚀 Key Benefits

- **Speed up development** with efficient Git operations
- **Debug faster** using blame and history views  
- **Visualize complex Git graphs** for better understanding
- **Perform safe interactive rebases** with visual feedback
- **Collaborate better** with clean commit history

## 📖 Documentation

### [**Complete Workflow Guide →**](git-workflow-guide.md)

The comprehensive guide includes:

- Setup instructions for both tools
- Step-by-step interactive rebase workflows
- Advanced graph visualization techniques  
- Real-world scenarios and solutions
- Pro tips and best practices
- Workflow automation examples

### [**Developer Workflow →**](developer-workflow.md)

Clean, comprehensive documentation covering:

- GitKraken CLI setup and authentication
- GitLens extension features
- Interactive rebase mastery
- Graph visualization techniques
- Advanced workflows and best practices

### [**Taskfile Guide →**](taskfile-guide.md)

Complete automation with Task runner:

- 70+ predefined tasks covering all GitKraken CLI features
- Workflow combinations for common development scenarios
- AI-powered development assistance
- Diagnostic and troubleshooting tasks
- Real-world usage examples

## 🛠️ Quick Start with Taskfile

The included `Taskfile.yml` provides comprehensive coverage of all GitKraken CLI features:

```bash
# Install Task runner (if not already installed)
brew install go-task/tap/go-task

# Show all available tasks
task --list

# Quick diagnostic check
task diagnostic:check

# Start daily workflow
task workflow:daily

# AI-powered commit
task ai:commit

# Create PR with AI
task ai:pr:create
```

## 📂 Files in This Directory

| File | Description |
|------|-------------|
| `Taskfile.yml` | Complete automation with 70+ tasks for all GitKraken CLI features |
| `git-workflow-guide.md` | Comprehensive workflow guide with examples |
| `developer-workflow.md` | Clean documentation of all features |
| `taskfile-guide.md` | Complete guide to using the Taskfile |

---

Start improving your Git workflow today! 🎉
