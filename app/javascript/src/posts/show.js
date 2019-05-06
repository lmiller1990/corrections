import * as Diff from 'diff'

const buildWord = (className, word, prependWhitespace) => {
  const whitespace = prependWhitespace ? '&nbsp' : ''
  return whitespace + `<span class="${className}">${word}</span>`.replace(/\n/gi, '<br>')
}

const renderDiff = () => {
  const original = document.getElementById('original').innerText
  const corrected = document.getElementById('corrected').innerText
  const diffed = document.getElementById('diff')

  if (!diffed) {
    return
  }

  const diff = Diff.diffWords(original, corrected)

  let first = true
  let html = ''

  for (const word of diff) {
    if (!word.added && !word.removed) {
      html += buildWord('', word.value.trim(), !first)   
    }

    if (word.added) {
      html += buildWord('added', word.value.trim(), !first)   
    }

    if (word.removed) {
      html += buildWord('removed', word.value.trim(), !first)   
    }

    first = false
  }

  diffed.innerHTML += html
}

export { renderDiff }

