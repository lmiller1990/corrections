import * as Diff from 'diff'

const buildWord = (className, word, prependWhitespace) => {
  const whitespace = prependWhitespace ? '&nbsp' : ''
  return whitespace + `<span class="${className}>${word}</span>`
}

const run = () => {
  const original = document.getElementById('original').innerText
  const corrected = document.getElementById('corrected').innerText
  const diffed = document.getElementById('diff')

  const diff = Diff.diffWords(original, corrected)
  console.log(diff)

  let first = true
  let html = ''

  for (for word of diff) {
    if (!word.added || !word.removed) {
      html += buildWord('', word.value, !first)   
    }

    if (word.added) {
      html += buildWord('added', word.value, !first)   
    }

    if (word.removed) {
      html += buildWord('removed', word.value, !first)   
    }

    first = false
  }

  diffed.innerHTML = html
  console.log(html)
}

document.addEventListener('DOMContentLoaded', run)
